#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT="$ROOT_DIR/.dev/build/validation-report.md"

required_files=()
while IFS= read -r required_file; do
  required_files+=("$required_file")
done < <(awk '
  /^required_files:/ { in_required=1; next }
  /^validation:/ { in_required=0 }
  in_required && /^[[:space:]]*-[[:space:]]*"/ {
    line=$0
    sub(/^[[:space:]]*-[[:space:]]*"/, "", line)
    sub(/".*$/, "", line)
    print line
  }
' "$ROOT_DIR/.dev/manifest.yaml")

mkdir -p "$(dirname "$REPORT")"
: > "$REPORT"

missing=()
for file in "${required_files[@]}"; do
  if [[ ! -f "$ROOT_DIR/$file" ]]; then
    missing+=("$file")
  fi
done

adapter_failures=()
for file in \
  "adapters/codex/AGENTS.md" \
  "adapters/claude/CLAUDE.md" \
  "adapters/cursor/rules/project.mdc" \
  "adapters/github-copilot/instructions.md" \
  "adapters/chatgpt/custom-instructions.md" \
  "adapters/generic/AGENT.md"; do
  if [[ -f "$ROOT_DIR/$file" ]] && ! grep -q "\.dev/.*source of truth\|\.dev/.*source-of-truth\|source of truth.*\.dev/" "$ROOT_DIR/$file"; then
    adapter_failures+=("$file")
  fi
done

advanced_output=""
advanced_status="SKIPPED"
if [[ -x "$ROOT_DIR/scripts/check-advanced-agent-features.sh" ]]; then
  if advanced_output="$("$ROOT_DIR/scripts/check-advanced-agent-features.sh" 2>&1)"; then
    advanced_status="PASS"
  else
    advanced_status="FAIL"
  fi
fi

token_output=""
token_status="SKIPPED"
if [[ -x "$ROOT_DIR/scripts/check-token-budget.sh" ]]; then
  if token_output="$("$ROOT_DIR/scripts/check-token-budget.sh" 2>&1)"; then
    token_status="PASS"
  else
    token_status="FAIL"
  fi
fi

schema_output=""
schema_status="SKIPPED"
if [[ -x "$ROOT_DIR/scripts/check-schemas.sh" ]]; then
  if schema_output="$("$ROOT_DIR/scripts/check-schemas.sh" 2>&1)"; then
    schema_status="PASS"
  else
    schema_status="FAIL"
  fi
fi

link_output=""
link_status="SKIPPED"
if [[ -x "$ROOT_DIR/scripts/check-markdown-links.sh" ]]; then
  if link_output="$("$ROOT_DIR/scripts/check-markdown-links.sh" 2>&1)"; then
    link_status="PASS"
  else
    link_status="FAIL"
  fi
fi

version_output=""
version_status="SKIPPED"
if [[ -x "$ROOT_DIR/scripts/check-version.sh" ]]; then
  if version_output="$("$ROOT_DIR/scripts/check-version.sh" 2>&1)"; then
    version_status="PASS"
  else
    version_status="FAIL"
  fi
fi

{
  echo "# Agentic Environment Validation Report"
  echo
  if [[ ${#missing[@]} -eq 0 && ${#adapter_failures[@]} -eq 0 && "$advanced_status" != "FAIL" && "$token_status" != "FAIL" && "$schema_status" != "FAIL" && "$link_status" != "FAIL" && "$version_status" != "FAIL" ]]; then
    echo "Status: PASS"
  else
    echo "Status: FAIL"
  fi
  echo
  echo "## Required Files"
  if [[ ${#missing[@]} -eq 0 ]]; then
    echo
    echo "- All required files exist."
  else
    echo
    for file in "${missing[@]}"; do
      echo "- Missing: $file"
    done
  fi
  echo
  echo "## Adapter Policy"
  if [[ ${#adapter_failures[@]} -eq 0 ]]; then
    echo
    echo "- All adapter files identify .dev/ as the source of truth."
  else
    echo
    for file in "${adapter_failures[@]}"; do
      echo "- Adapter policy missing or unclear: $file"
    done
  fi
  echo
  echo "## Advanced Feature Check"
  echo
  echo "- Status: $advanced_status"
  if [[ -n "$advanced_output" ]]; then
    echo
    echo '```text'
    echo "$advanced_output"
    echo '```'
  fi
  echo
  echo "## Token Budget Check"
  echo
  echo "- Status: $token_status"
  if [[ -n "$token_output" ]]; then
    echo
    echo '```text'
    echo "$token_output"
    echo '```'
  fi
  echo
  echo "## Schema Check"
  echo
  echo "- Status: $schema_status"
  if [[ -n "$schema_output" ]]; then
    echo
    echo '```text'
    echo "$schema_output"
    echo '```'
  fi
  echo
  echo "## Markdown Link Check"
  echo
  echo "- Status: $link_status"
  if [[ -n "$link_output" ]]; then
    echo
    echo '```text'
    echo "$link_output"
    echo '```'
  fi
  echo
  echo "## Version Check"
  echo
  echo "- Status: $version_status"
  if [[ -n "$version_output" ]]; then
    echo
    echo '```text'
    echo "$version_output"
    echo '```'
  fi
  echo
  echo "## Advanced Feature Scope"
  echo
  echo "- Model routing: enabled as a vendor-neutral contract module."
  echo "- Token compression: enabled as a vendor-neutral contract module."
  echo "- Marketplace plugins: enabled as a governed extension contract."
  echo "- Complex multi-agent delegation: enabled as a governed coordination contract."
  echo "- Provider-specific runtime mappings remain non-canonical."
} > "$REPORT"

if [[ ${#missing[@]} -eq 0 && ${#adapter_failures[@]} -eq 0 && "$advanced_status" != "FAIL" && "$token_status" != "FAIL" && "$schema_status" != "FAIL" && "$link_status" != "FAIL" && "$version_status" != "FAIL" ]]; then
  echo "PASS: validation report written to $REPORT"
  exit 0
fi

echo "FAIL: validation report written to $REPORT"
exit 1
