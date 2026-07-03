#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EVAL_DIR="$ROOT_DIR/.dev/evals"
failures=0

echo "# Eval Run"
echo

for eval_file in "$EVAL_DIR"/*.yml; do
  name="$(basename "$eval_file")"
  echo "## $name"

  # Behavioral sections are judged by a reviewer or agent; automated_checks run here.
  checks="$(awk '/^automated_checks:/ { found=1; next } found && /^  - / { sub(/^  - /, ""); gsub(/"/,""); print } found && /^[a-z]/ { exit }' "$eval_file")"

  if [[ -z "$checks" ]]; then
    echo "  behavioral-only (no automated_checks)"
    echo
    continue
  fi

  while IFS= read -r cmd; do
    [[ -z "$cmd" ]] && continue
    if (cd "$ROOT_DIR" && bash -c "$cmd" > /dev/null 2>&1); then
      echo "  PASS: $cmd"
    else
      echo "  FAIL: $cmd"
      failures=$((failures + 1))
    fi
  done <<< "$checks"
  echo
done

if [[ "$failures" -gt 0 ]]; then
  echo "Eval run failed: $failures automated check(s) failing."
  exit 1
fi
echo "Eval run passed."
