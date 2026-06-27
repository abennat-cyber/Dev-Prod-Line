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
  ".dev/standards/advanced-agent-features.md"
  ".dev/procedures/add-feature.md"
  ".dev/procedures/fix-bug.md"
  ".dev/procedures/review-code.md"
  ".dev/procedures/refactor-module.md"
  ".dev/procedures/write-tests.md"
  ".dev/procedures/update-docs.md"
  ".dev/procedures/investigate-incident.md"
  ".dev/procedures/release-change.md"
  ".dev/procedures/route-model.md"
  ".dev/procedures/compress-context.md"
  ".dev/procedures/manage-marketplace-plugin.md"
  ".dev/procedures/delegate-agent-work.md"
  ".dev/guardrails/global.md"
  ".dev/guardrails/coding.md"
  ".dev/guardrails/testing.md"
  ".dev/guardrails/security.md"
  ".dev/guardrails/generated-files.md"
  ".dev/guardrails/data-and-privacy.md"
  ".dev/guardrails/dependencies.md"
  ".dev/guardrails/model-routing.md"
  ".dev/guardrails/token-compression.md"
  ".dev/guardrails/marketplace-plugins.md"
  ".dev/guardrails/multi-agent-delegation.md"
  ".dev/knowledge/index.md"
  ".dev/knowledge/architecture.md"
  ".dev/knowledge/domain-model.md"
  ".dev/knowledge/local-development.md"
  ".dev/knowledge/deployment.md"
  ".dev/knowledge/decisions.md"
  ".dev/knowledge/runbooks.md"
  ".dev/knowledge/agent-platform.md"
  ".dev/skills/build-agentic-dev-environment/skill.md"
  ".dev/skills/add-feature/skill.md"
  ".dev/skills/review-code/skill.md"
  ".dev/skills/update-knowledge/skill.md"
  ".dev/skills/route-model/skill.md"
  ".dev/skills/compress-context/skill.md"
  ".dev/skills/manage-marketplace-plugin/skill.md"
  ".dev/skills/delegate-agent-work/skill.md"
  ".dev/model-routing/README.md"
  ".dev/model-routing/policy.yaml"
  ".dev/model-routing/evaluation-matrix.yaml"
  ".dev/token-compression/README.md"
  ".dev/token-compression/policy.yaml"
  ".dev/token-compression/context-ledger.md"
  ".dev/marketplace/README.md"
  ".dev/marketplace/plugin-contract.yaml"
  ".dev/marketplace/registry.yaml"
  ".dev/delegation/README.md"
  ".dev/delegation/protocol.yaml"
  ".dev/delegation/roles.yaml"
  ".dev/workflows/README.md"
  ".dev/evals/README.md"
  ".dev/evals/code-review.yml"
  ".dev/evals/test-quality.yml"
  ".dev/evals/architecture-review.yml"
  ".dev/evals/model-routing.yml"
  ".dev/evals/token-compression.yml"
  ".dev/evals/marketplace-plugin-review.yml"
  ".dev/evals/multi-agent-delegation.yml"
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
  "scripts/check-advanced-agent-features.sh"
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

advanced_output=""
advanced_status="SKIPPED"
if [[ -x "$ROOT_DIR/scripts/check-advanced-agent-features.sh" ]]; then
  advanced_output="$("$ROOT_DIR/scripts/check-advanced-agent-features.sh" 2>&1)"
  if [[ $? -eq 0 ]]; then
    advanced_status="PASS"
  else
    advanced_status="FAIL"
  fi
fi

{
  echo "# Agentic Environment Validation Report"
  echo
  echo "Generated: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  echo
  if [[ ${#missing[@]} -eq 0 && ${#adapter_failures[@]} -eq 0 && "$advanced_status" != "FAIL" ]]; then
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
  echo "## Advanced Feature Scope"
  echo
  echo "- Model routing: enabled as a vendor-neutral contract module."
  echo "- Token compression: enabled as a vendor-neutral contract module."
  echo "- Marketplace plugins: enabled as a governed extension contract."
  echo "- Complex multi-agent delegation: enabled as a governed coordination contract."
  echo "- Provider-specific runtime mappings remain non-canonical."
} > "$REPORT"

if [[ ${#missing[@]} -eq 0 && ${#adapter_failures[@]} -eq 0 && "$advanced_status" != "FAIL" ]]; then
  echo "PASS: validation report written to $REPORT"
  exit 0
fi

echo "FAIL: validation report written to $REPORT"
exit 1
