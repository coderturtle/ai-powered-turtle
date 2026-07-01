#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

failures=0

check_file() {
  local path="$1"
  if [[ -f "$path" ]]; then
    echo "ok: $path"
  else
    echo "missing: $path"
    failures=$((failures + 1))
  fi
}

check_dir() {
  local path="$1"
  if [[ -d "$path" ]]; then
    echo "ok: $path/"
  else
    echo "missing: $path/"
    failures=$((failures + 1))
  fi
}

check_file ".hekton/project.yaml"
check_file "README.md"
check_file "package.json"
check_file "package-lock.json"
check_file "quartz.config.ts"
check_file "quartz.layout.ts"
check_dir "content"
check_dir "quartz"

if [[ "$failures" -ne 0 ]]; then
  echo "Structural verification failed with $failures issue(s)."
  exit 1
fi

if [[ -d node_modules ]]; then
  npm run check
  npm test
else
  echo "node_modules not present; skipped npm run check and npm test."
fi

echo "Verification complete."
