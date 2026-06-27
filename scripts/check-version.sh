#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
version_file="$ROOT_DIR/.dev/VERSION"
manifest="$ROOT_DIR/.dev/manifest.yaml"
changelog="$ROOT_DIR/CHANGELOG.md"

if [[ ! -f "$version_file" ]]; then
  echo "FAIL: .dev/VERSION is missing"
  exit 1
fi

version="$(tr -d '[:space:]' < "$version_file")"
if ! printf '%s' "$version" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "FAIL: .dev/VERSION must be semantic version, got '$version'"
  exit 1
fi

schema_version="$(awk -F'"' '/^schema_version:/ { print $2; exit }' "$manifest")"
if [[ "$schema_version" != "$version" ]]; then
  echo "FAIL: manifest schema_version '$schema_version' does not match .dev/VERSION '$version'"
  exit 1
fi

if ! grep -q "## \\[$version\\]" "$changelog"; then
  echo "FAIL: CHANGELOG.md has no entry for $version"
  exit 1
fi

echo "Version check passed: $version"
