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

Write-Host '==> Updating submodules to latest remote commits'
git submodule update --remote --recursive
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Write-Host ''
Write-Host '==> Current submodule status'
git submodule status --recursive
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
