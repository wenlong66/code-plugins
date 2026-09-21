---
name: android-apk-build
description: Build an installable Android Debug APK from an Expo/React Native Managed/CNG app or an existing Android Gradle project. Use this skill whenever a user asks to package, build, export, generate, or obtain an Android APK for local installation, testing on a phone, USB/ADB installation, or an emulator — even if they only say “打包安卓”, “出个 APK”, “build Android”, or “run it on my phone”. Detect the required JDK, Android SDK, Gradle, Expo, and package-manager tools; preserve the source tree; validate the APK; and handle Windows pnpm/CMake path-length failures. Do not use this skill for Play Store publishing, signing-key management, or an AAB/release build unless the user explicitly asks for that separately.
compatibility: Requires a local Android SDK and JDK 17+ for native builds. Supports Windows, macOS, and Linux; Windows + pnpm has a documented short-path fallback.
---

# Android APK build

Produce a **locally installable Debug APK** by default. A Debug APK is signed with the Android debug key and is appropriate for a phone, emulator, and QA. It is not a release artifact and must not be presented as Play Store-ready.

## 1. Establish the build target

When the user asks vaguely to “package Android,” use Debug APK as the default and say so briefly. Do not block on a format question unless they explicitly need a store upload, a signed release, or an AAB.

Before acting:

1. Inspect the repository state with `git status --short` when it is a Git repository.
2. Detect the project shape:
   - **Expo Managed/CNG**: `app.json` or `app.config.*` plus an `expo` dependency, usually without a tracked `android/` directory.
   - **Expo/React Native native project**: `android/gradlew` and Gradle settings are present.
   - **Plain Android Gradle project**: Gradle settings plus an Android application module are present.
3. Read the package manager declaration (`packageManager`, lockfile, workspace configuration) before picking `pnpm`, npm, or Yarn.
4. Report the intended artifact type, input revision, and output location before starting a slow build.

Do not mistake `expo export --platform android` for an APK build: it creates a JavaScript bundle, not an installable APK.

## 2. Discover tools and prerequisites

Check these facts rather than assuming them:

- JDK version: Android Gradle Plugin / current React Native builds generally need **JDK 17 or newer**. If `java` resolves to JDK 8 or 11, look for a local JDK 17 before asking the user to install one.
- Android SDK location: `ANDROID_SDK_ROOT` or `ANDROID_HOME`; confirm it has an Android platform and build-tools. Search common local locations only when the environment variables are absent.
- A Gradle wrapper: prefer the project’s `gradlew` / `gradlew.bat`, never a random global Gradle installation.
- Expo app health: run `expo install --check` through the workspace package manager when the project uses Expo.

If the Android SDK is configured but missing compile/build tools, Gradle may provision its required platform, build-tools, or NDK into that configured SDK. State this before the build. If JDK 17 or a usable SDK is genuinely unavailable, stop with exact installation requirements instead of guessing paths or changing project dependencies.

## 3. Preserve the source tree

Expo `prebuild` can create `android/` and modify app configuration or package scripts. Managed/CNG projects often intentionally do not commit those changes.

- Record whether `android/`, `ios/`, and affected configuration files existed before building.
- Prefer an isolated temporary workspace for a Managed/CNG build. A clean committed Git worktree is suitable; otherwise use a temporary copy that includes the user’s current source state but excludes build artifacts and `node_modules`.
- Never blindly run `git restore`, `git clean`, or delete a pre-existing native directory. Restore or remove only files and directories that this build created, after verifying their origin.
- Copy the finished APK to its final destination **before** cleaning the temporary build workspace.

A sensible default output is a sibling of the repository, such as `<repository-parent>/<project-name>-debug.apk`, so the artifact does not make the Git worktree dirty. Inspect any existing destination before overwriting it.

## 4. Build paths

### Expo Managed/CNG

In the isolated workspace:

1. Install workspace dependencies with the project’s declared package manager.
2. Run `expo install --check`.
3. Run `expo prebuild --platform android --no-install`.
4. Set `JAVA_HOME` to JDK 17+ and `ANDROID_SDK_ROOT` / `ANDROID_HOME` to the discovered SDK for the Gradle process.
5. Invoke the generated wrapper from the generated Android project, explicitly selecting its project directory if the current directory differs:

   ```text
   gradlew :app:assembleDebug
   ```

The usual artifact is:

```text
android/app/build/outputs/apk/debug/app-debug.apk
```

### Existing Android Gradle project

1. Inspect `settings.gradle[.kts]` and the app module rather than assuming it is named `app`.
2. Use the project wrapper to build the debug variant. For the conventional module:

   ```text
   ./gradlew :app:assembleDebug
   ```

3. Locate the produced `*-debug.apk` below the application module’s `build/outputs/apk/` directory.

Run available type checks and tests before a long native build when the project provides them. Report failures faithfully; never claim that an APK proves application behavior.

## 5. Windows + pnpm CMake path-length fallback

Use this fallback only after a native build reports the characteristic CMake/Ninja path-length failure, for example:

```text
CMAKE_OBJECT_PATH_MAX
manifest 'build.ninja' still dirty after 100 tries
```

Do **not** work around this by changing the app’s React Native architecture or committing generated native configuration. The problem is build-path depth, not necessarily application code.

1. Keep the original repository untouched.
2. Create a short-path temporary workspace such as `E:\x` or `C:\x`; ensure it does not already contain user files.
3. For a clean Git repository, create a detached worktree at that path. For dirty source, use a temporary copy that includes the current source state.
4. In that temporary workspace, install dependencies with pnpm’s hoisted node-linker for this build only:

   ```text
   pnpm install --node-linker=hoisted
   ```

   Hoisting shortens paths such as `node_modules/.pnpm/<long-package-name>/...` enough for CMake object files.
5. Run Expo prebuild there if needed, then rebuild with the project Gradle wrapper.
6. Copy and validate the APK, then remove only the temporary workspace and any generated native directories it contains.

On Windows, ordinary deletion can itself fail on deep `node_modules` paths. Use a long-path-capable deletion method only on a verified temporary directory created by this build. Do not apply broad deletion commands to the user’s source checkout.

## 6. Validate and deliver the APK

After the build:

1. Check the output file exists and report its exact absolute path and size.
2. Find `apksigner` under the discovered Android SDK build-tools and run:

   ```text
   apksigner verify --verbose <apk-path>
   ```

   Debug builds normally report v2 signing. If `apksigner` is unavailable, state that signature verification was skipped rather than inventing a result.
3. Calculate SHA-256 when an appropriate local utility is available.
4. Restore the original repository state and verify `git status --short` when applicable.
5. Give concise installation guidance:
   - Copy the APK to a phone and allow the file manager to install unknown apps; or
   - install through USB debugging with `adb install -r <apk-path>`.

## 7. Report structure

Use this structure after every build:

```markdown
## Android build result

- Artifact: `<absolute APK path>`
- Type: Debug APK / Release APK / AAB
- Source revision: `<commit or working-tree state>`
- Signature verification: passed / skipped / failed
- SHA-256: `<hash or unavailable>`
- Source tree: restored clean / list remaining user changes

## Install

<phone and adb instructions>

## Notes

<debug-vs-release limitations, temporary tool installation, or known caveats>
```

## Release and AAB boundary

A release APK/AAB needs an intentional application ID, signing strategy, and often EAS or store credentials. Do not upload source code to EAS, create cloud builds, access a keystore, publish an artifact, or select a release signing identity without explicit user approval. If asked for a release build, first explain exactly which signing and distribution decision is still required.
