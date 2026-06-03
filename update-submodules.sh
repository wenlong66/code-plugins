#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

echo "==> Syncing submodule URLs"
git submodule sync --recursive

echo "==> Initializing submodules"
git submodule update --init --recursive

echo "==> Updating submodules to latest remote commits"
git submodule update --remote --recursive

echo
echo "==> Current submodule status"
git submodule status --recursive
