#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  echo "Usage: scripts/sync-agent-adapters.sh [--check|--create-missing]"
  echo
  echo "Checks adapter presence and creates missing adapters only when requested."
  echo "Existing adapter files are never overwritten."
}

mode="${1:---check}"
case "$mode" in
  --check|--create-missing) ;;
  -h|--help) usage; exit 0 ;;
  *) usage; exit 2 ;;
esac

adapters=(
  "adapters/codex/AGENTS.md"
  "adapters/claude/CLAUDE.md"
  "adapters/cursor/rules/project.mdc"
  "adapters/github-copilot/instructions.md"
  "adapters/chatgpt/custom-instructions.md"
  "adapters/generic/AGENT.md"
)

missing=0
for file in "${adapters[@]}"; do
  path="$ROOT_DIR/$file"
  if [[ -f "$path" ]]; then
    echo "OK: $file exists; leaving unchanged."
    continue
  fi

  missing=$((missing + 1))
  if [[ "$mode" == "--create-missing" ]]; then
    mkdir -p "$(dirname "$path")"
    {
      echo "# Agent Adapter"
      echo
      echo "This file is a compatibility layer only."
      echo
      echo ".dev/ is the source of truth. Follow .dev/manifest.yaml, .dev/standards/, .dev/procedures/, .dev/guardrails/, and .dev/knowledge/index.md."
      echo
      echo "Do not duplicate or override canonical .dev/ rules here unless required by the target tool."
    } > "$path"
    echo "CREATED: $file"
  else
    echo "MISSING: $file"
  fi
done

if [[ "$mode" == "--check" && "$missing" -gt 0 ]]; then
  echo "Adapter sync check found missing adapters. Re-run with --create-missing to create only missing files."
  exit 1
fi

echo "Adapter sync complete. Existing files were not overwritten."
