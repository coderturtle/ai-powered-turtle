#!/usr/bin/env bash
set -euo pipefail

failures=0

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "ok: $cmd found"
  else
    echo "missing: $cmd"
    failures=$((failures + 1))
  fi
}

check_cmd node
check_cmd npm
check_cmd git

if command -v node >/dev/null 2>&1; then
  node_major="$(node -v | sed 's/^v//' | cut -d. -f1)"
  if [[ "$node_major" -lt 20 ]]; then
    echo "missing: node version must be 20 or newer"
    failures=$((failures + 1))
  fi
fi

if [[ "$failures" -ne 0 ]]; then
  echo "Prerequisite check failed with $failures issue(s)."
  exit 1
fi

echo "Prerequisite check passed."
