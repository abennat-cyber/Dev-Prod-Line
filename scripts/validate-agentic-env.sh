#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT="$ROOT_DIR/.dev/build/validation-report.md"

required_files=(
  ".dev/manifest.yaml"
  ".dev/README.md"
  ".dev/build/status.md"
  ".dev/build/log.md"
  ".dev/build/decisions.md"
  ".dev/build/validation-report.md"
  ".dev/standards/engineering.md"
  ".dev/standards/testing.md"
  ".dev/standards/security.md"
  ".dev/standards/documentation.md"
  ".dev/standards/observability.md"
  ".dev/standards/ai-assisted-engineering.md"
  ".dev/procedures/add-feature.md"
  ".dev/procedures/fix-bug.md"
  ".dev/procedures/review-code.md"
  ".dev/procedures/refactor-module.md"
  ".dev/procedures/write-tests.md"
  ".dev/procedures/update-docs.md"
  ".dev/procedures/investigate-incident.md"
  ".dev/procedures/release-change.md"
  ".dev/guardrails/global.md"
  ".dev/guardrails/coding.md"
  ".dev/guardrails/testing.md"
  ".dev/guardrails/security.md"
  ".dev/guardrails/generated-files.md"
  ".dev/guardrails/data-and-privacy.md"
  ".dev/guardrails/dependencies.md"
  ".dev/knowledge/index.md"
  ".dev/knowledge/architecture.md"
  ".dev/knowledge/domain-model.md"
  ".dev/knowledge/local-development.md"
  ".dev/knowledge/deployment.md"
  ".dev/knowledge/decisions.md"
  ".dev/knowledge/runbooks.md"
  ".dev/skills/build-agentic-dev-environment/skill.md"
  ".dev/skills/add-feature/skill.md"
  ".dev/skills/review-code/skill.md"
  ".dev/skills/update-knowledge/skill.md"
  ".dev/workflows/README.md"
  ".dev/evals/README.md"
  ".dev/evals/code-review.yml"
  ".dev/evals/test-quality.yml"
  ".dev/evals/architecture-review.yml"
  "adapters/codex/AGENTS.md"
  "adapters/claude/CLAUDE.md"
  "adapters/cursor/rules/project.mdc"
  "adapters/github-copilot/instructions.md"
  "adapters/chatgpt/custom-instructions.md"
  "adapters/generic/AGENT.md"
  "scripts/validate-agentic-env.sh"
  "scripts/sync-agent-adapters.sh"
  "scripts/check-docs-drift.sh"
  "scripts/check-generated-files.sh"
)

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

{
  echo "# Agentic Environment Validation Report"
  echo
  echo "Generated: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  echo
  if [[ ${#missing[@]} -eq 0 && ${#adapter_failures[@]} -eq 0 ]]; then
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
  echo "## MVP Scope"
  echo
  echo "- Model routing: not implemented."
  echo "- Token compression: not implemented."
  echo "- Marketplace plugins: not implemented."
  echo "- Complex multi-agent delegation: not implemented."
} > "$REPORT"

if [[ ${#missing[@]} -eq 0 && ${#adapter_failures[@]} -eq 0 ]]; then
  echo "PASS: validation report written to $REPORT"
  exit 0
fi

echo "FAIL: validation report written to $REPORT"
exit 1
