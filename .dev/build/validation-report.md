# Agentic Environment Validation Report

Generated: 2026-06-27T18:30:13Z

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

## Advanced Feature Scope

- Model routing: enabled as a vendor-neutral contract module.
- Token compression: enabled as a vendor-neutral contract module.
- Marketplace plugins: enabled as a governed extension contract.
- Complex multi-agent delegation: enabled as a governed coordination contract.
- Provider-specific runtime mappings remain non-canonical.
