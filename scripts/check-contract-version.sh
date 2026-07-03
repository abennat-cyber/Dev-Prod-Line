#!/usr/bin/env bash
set -euo pipefail

# For repositories consuming the Dev-Prod-Line contract: compares the local
# .dev/VERSION against the upstream scaffold and reports drift.
# Usage: check-contract-version.sh [upstream_repo_url]

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UPSTREAM="${1:-https://github.com/abennat-cyber/Dev-Prod-Line.git}"

local_version="$(tr -d '[:space:]' < "$ROOT_DIR/.dev/VERSION")"
echo "Local contract version: $local_version"

upstream_version="$(git ls-remote --tags --refs "$UPSTREAM" 2>/dev/null \
  | awk -F'refs/tags/v?' '{ print $2 }' \
  | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' \
  | sort -t. -k1,1n -k2,2n -k3,3n \
  | tail -1 || true)"

if [[ -z "$upstream_version" ]]; then
  echo "UNKNOWN: could not read upstream tags from $UPSTREAM (offline or no tags)."
  echo "Drift check skipped. Tag releases upstream as vMAJOR.MINOR.PATCH to enable it."
  exit 0
fi

echo "Upstream latest release: $upstream_version"
if [[ "$local_version" == "$upstream_version" ]]; then
  echo "Contract is current."
else
  echo "DRIFT: local $local_version differs from upstream $upstream_version."
  echo "Review CHANGELOG.md and MIGRATION.md upstream before updating."
fi
