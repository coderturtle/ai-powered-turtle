#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

scripts/check-prereqs.sh

if [[ ! -f package-lock.json ]]; then
  echo "package-lock.json is missing; refusing to install dependencies without a lockfile."
  exit 1
fi

npm install

echo "Bootstrap complete."
