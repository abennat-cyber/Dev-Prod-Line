#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
failures=0

require_file() {
  file="$1"
  if [[ ! -f "$ROOT_DIR/$file" ]]; then
    echo "MISSING: $file"
    failures=$((failures + 1))
  else
    echo "OK: $file"
  fi
}

require_contains() {
  file="$1"
  pattern="$2"
  message="$3"
  require_file "$file"
  if [[ -f "$ROOT_DIR/$file" ]] && ! grep -q "$pattern" "$ROOT_DIR/$file"; then
    echo "FAIL: $message ($file)"
    failures=$((failures + 1))
  fi
}

require_contains ".dev/model-routing/policy.yaml" "capability_profiles:" "model routing must define capability profiles"
require_contains ".dev/model-routing/policy.yaml" "Never make a provider-specific model canonical" "model routing must reject canonical provider models"
require_contains ".dev/token-compression/policy.yaml" "must_preserve:" "token compression must define preservation rules"
require_contains ".dev/token-compression/policy.yaml" "must_not_compress_away:" "token compression must define non-compressible context"
require_contains ".dev/marketplace/plugin-contract.yaml" "required_fields:" "marketplace plugins must define required fields"
require_contains ".dev/marketplace/registry.yaml" "approved_plugins:" "marketplace registry must track approved plugins"
require_contains ".dev/delegation/protocol.yaml" "lead_agent:" "delegation must define a lead agent"
require_contains ".dev/delegation/protocol.yaml" "integration_rules:" "delegation must define integration rules"
require_contains ".dev/standards/advanced-agent-features.md" "provider" "advanced standard must address provider neutrality"

if grep -R "MUST NOT be added to this MVP\\|not implemented\\." "$ROOT_DIR/.dev" >/dev/null 2>&1; then
  echo "FAIL: Found stale MVP exclusion language in .dev advanced contract."
  failures=$((failures + 1))
else
  echo "OK: no stale advanced-feature exclusion language found."
fi

if [[ "$failures" -gt 0 ]]; then
  echo "Advanced agent feature check failed."
  exit 1
fi

echo "Advanced agent feature check passed."
