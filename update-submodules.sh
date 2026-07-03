#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

echo "==> Syncing submodule URLs"
git submodule sync --recursive

echo "==> Updating existing submodules to latest configured branches"
while read -r submodule_key submodule_path; do
    submodule_name="${submodule_key#submodule.}"
    submodule_name="${submodule_name%.path}"

    if [[ ! -d "$submodule_path" ]]; then
        echo "==> Skipping $submodule_name: $submodule_path does not exist"
        continue
    fi

    branch="$(git config --file .gitmodules --get "submodule.$submodule_name.branch")"
    if [[ -z "$branch" ]]; then
        echo "No branch configured for submodule: $submodule_name" >&2
        exit 1
    fi

    echo "==> Updating $submodule_name ($branch)"
    git -C "$submodule_path" fetch origin "$branch"

    if git -C "$submodule_path" show-ref --verify --quiet "refs/heads/$branch"; then
        git -C "$submodule_path" checkout "$branch"
    else
        git -C "$submodule_path" checkout -B "$branch" "origin/$branch"
    fi

    git -C "$submodule_path" branch --set-upstream-to "origin/$branch" "$branch"
    git -C "$submodule_path" pull --ff-only origin "$branch"
done < <(git config --file .gitmodules --get-regexp '^submodule\..*\.path$')

echo
echo "==> Current submodule status"
git submodule status --recursive
