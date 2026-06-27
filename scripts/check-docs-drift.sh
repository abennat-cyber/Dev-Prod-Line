#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
failures=0

check_contains() {
  file="$1"
  pattern="$2"
  message="$3"
  if [[ ! -f "$ROOT_DIR/$file" ]]; then
    echo "MISSING: $file"
    failures=$((failures + 1))
    return
  fi
  if ! grep -q "$pattern" "$ROOT_DIR/$file"; then
    echo "DRIFT: $message ($file)"
    failures=$((failures + 1))
  else
    echo "OK: $file"
  fi
}

check_contains ".dev/README.md" "\.dev/.*canonical" ".dev README should state that .dev/ is canonical"
check_contains ".dev/README.md" "Advanced modules" ".dev README should list advanced modules"
check_contains ".dev/knowledge/index.md" "MUST NOT load every knowledge file" "knowledge index should keep lazy-loading rule"
check_contains ".dev/manifest.yaml" "advanced_features" "manifest should declare advanced feature files"

for file in \
  "adapters/codex/AGENTS.md" \
  "adapters/claude/CLAUDE.md" \
  "adapters/cursor/rules/project.mdc" \
  "adapters/github-copilot/instructions.md" \
  "adapters/chatgpt/custom-instructions.md" \
  "adapters/generic/AGENT.md"; do
  check_contains "$file" "\.dev/.*source of truth" "adapter should point to .dev/ as source of truth"
done

echo "TODO: Add repository-specific documentation drift checks once project docs exist."

if [[ "$failures" -gt 0 ]]; then
  exit 1
fi
