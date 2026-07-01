$ErrorActionPreference = 'Stop'

$rootDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $rootDir

Write-Host '==> Syncing submodule URLs'
git submodule sync --recursive
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Write-Host '==> Initializing submodules'
git submodule update --init --recursive
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Write-Host '==> Updating submodules to latest configured branches'
$submodulePaths = git config --file .gitmodules --get-regexp '^submodule\..*\.path$'
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

foreach ($submodulePathEntry in $submodulePaths) {
    if ($submodulePathEntry -notmatch '^submodule\.(.+)\.path\s+(.+)$') {
        Write-Error "Could not parse submodule path entry: $submodulePathEntry"
        exit 1
    }

    $submoduleName = $Matches[1]
    $submodulePath = $Matches[2]
    $branch = git config --file .gitmodules --get "submodule.$submoduleName.branch"
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($branch)) {
        Write-Error "No branch configured for submodule: $submoduleName"
        exit 1
    }

    Write-Host "==> Updating $submoduleName ($branch)"
    Push-Location $submodulePath
    try {
        git fetch origin $branch
        if ($LASTEXITCODE -ne 0) {
            exit $LASTEXITCODE
        }

        git show-ref --verify --quiet "refs/heads/$branch"
        if ($LASTEXITCODE -eq 0) {
            git checkout $branch
        } else {
            git checkout -B $branch "origin/$branch"
        }
        if ($LASTEXITCODE -ne 0) {
            exit $LASTEXITCODE
        }

        git branch --set-upstream-to "origin/$branch" $branch
        if ($LASTEXITCODE -ne 0) {
            exit $LASTEXITCODE
        }

        git pull --ff-only origin $branch
        if ($LASTEXITCODE -ne 0) {
            exit $LASTEXITCODE
        }
    } finally {
        Pop-Location
    }
}

Write-Host ''
Write-Host '==> Current submodule status'
git submodule status --recursive
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
