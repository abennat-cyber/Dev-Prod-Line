#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
failures=0

is_external() {
  case "$1" in
    http://*|https://*|mailto:*|\#*) return 0 ;;
    *) return 1 ;;
  esac
}

while IFS= read -r -d '' file; do
  while IFS= read -r link; do
    target="$(printf '%s' "$link" | sed -E 's/^.*\]\(([^)]*)\).*$/\1/; s/#.*$//; s/^"//; s/"$//')"
    [[ -z "$target" ]] && continue
    is_external "$target" && continue
    if [[ "$target" == file://* ]]; then
      target="${target#file://}"
    fi
    if [[ "$target" = /* ]]; then
      resolved="$target"
    else
      resolved="$(cd "$(dirname "$file")" && pwd)/$target"
    fi
    if [[ ! -e "$resolved" ]]; then
      rel_file="${file#$ROOT_DIR/}"
      echo "BROKEN: $rel_file -> $target"
      failures=$((failures + 1))
    fi
  done < <(grep -Eo '\[[^]]+\]\([^)]+\)' "$file" || true)
done < <(find "$ROOT_DIR" \
  -path "$ROOT_DIR/.git" -prune -o \
  -path "$ROOT_DIR/Dev-Prod-Line" -prune -o \
  -name "*.md" -type f -print0)

if [[ "$failures" -gt 0 ]]; then
  exit 1
fi

echo "Markdown link check passed."
