#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "# Generated File Check"
echo
echo "Repository-specific generated-file conventions are UNKNOWN."
echo "Conservative scan for common generated markers:"

matches="$(find "$ROOT_DIR" \
  -path "$ROOT_DIR/.git" -prune -o \
  -type f \
  \( -name "*.md" -o -name "*.yaml" -o -name "*.yml" -o -name "*.json" -o -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.sh" \) \
  -print0 | xargs -0 grep -IlE 'generated|do not edit|auto-generated' 2>/dev/null || true)"

if [[ -z "$matches" ]]; then
  echo "- No generated-file markers found."
else
  echo "$matches" | sed 's#^#- #'
fi

echo
echo "TODO: Replace this conservative scan with project-specific generated-file rules once build tooling exists."
