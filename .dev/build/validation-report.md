# Agentic Environment Validation Report

Status: PASS

## Required Files

- All required files exist.

## Adapter Policy

- All adapter files identify .dev/ as the source of truth.

## Advanced Feature Check

- Status: PASS

```text
OK: .dev/model-routing/policy.yaml
OK: .dev/model-routing/policy.yaml
OK: .dev/token-compression/policy.yaml
OK: .dev/token-compression/policy.yaml
OK: .dev/marketplace/plugin-contract.yaml
OK: .dev/marketplace/registry.yaml
OK: .dev/delegation/protocol.yaml
OK: .dev/delegation/protocol.yaml
OK: .dev/standards/advanced-agent-features.md
OK: no stale advanced-feature exclusion language found.
Advanced agent feature check passed.
```

## Token Budget Check

- Status: PASS

```text
# Token Budget Check

OK: .dev/manifest.yaml estimated 1738 / 1900 tokens
OK: .dev/knowledge/index.md estimated 288 / 450 tokens
OK: .dev/guardrails/global.md estimated 166 / 300 tokens
OK: .dev/README.md estimated 548 / 650 tokens

Total eager estimate: 2740 / 3400 tokens
OK: context ledger sentinel is session_state: none
Token budget check passed.
```

## Schema Check

- Status: PASS

```text
OK: .dev/manifest.yaml validates against .dev/schemas/manifest.schema.json
OK: .dev/context-map.yaml validates against .dev/schemas/context-map.schema.json
OK: .dev/marketplace/registry.yaml validates against .dev/schemas/marketplace-registry.schema.json
OK: .dev/marketplace/plugin-contract.yaml validates against .dev/schemas/marketplace-plugin-contract.schema.json
OK: .dev/model-routing/policy.yaml validates against .dev/schemas/model-routing-policy.schema.json
OK: .dev/model-routing/evaluation-matrix.yaml validates against .dev/schemas/model-routing-evaluation-matrix.schema.json
OK: .dev/token-compression/policy.yaml validates against .dev/schemas/token-compression-policy.schema.json
OK: .dev/delegation/protocol.yaml validates against .dev/schemas/delegation-protocol.schema.json
OK: .dev/delegation/roles.yaml validates against .dev/schemas/delegation-roles.schema.json
OK: .dev/security/data-classification.yaml validates against .dev/schemas/data-classification.schema.json
OK: .dev/evals/architecture-review.yml validates against .dev/schemas/eval.schema.json
OK: .dev/evals/code-review.yml validates against .dev/schemas/eval.schema.json
OK: .dev/evals/marketplace-plugin-review.yml validates against .dev/schemas/eval.schema.json
OK: .dev/evals/model-routing.yml validates against .dev/schemas/eval.schema.json
OK: .dev/evals/multi-agent-delegation.yml validates against .dev/schemas/eval.schema.json
OK: .dev/evals/test-quality.yml validates against .dev/schemas/eval.schema.json
OK: .dev/evals/token-compression.yml validates against .dev/schemas/eval.schema.json
```

## Markdown Link Check

- Status: PASS

```text
Markdown link check passed.
```

## Version Check

- Status: PASS

```text
Version check passed: 1.1.0
```

## Advanced Feature Scope

- Model routing: enabled as a vendor-neutral contract module.
- Token compression: enabled as a vendor-neutral contract module.
- Marketplace plugins: enabled as a governed extension contract.
- Complex multi-agent delegation: enabled as a governed coordination contract.
- Provider-specific runtime mappings remain non-canonical.
