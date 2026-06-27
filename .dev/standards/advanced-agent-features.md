# Advanced Agent Features Standard

## Purpose

Define professional expectations for model routing, token compression, marketplace plugins, and multi-agent delegation.

## Rules

1. Advanced features must be implemented as `.dev/` contract modules before adapters translate them.
2. Model routing must use capability profiles, not vendor-specific model names.
3. Token compression must preserve instructions, constraints, decisions, validation results, and unresolved risks.
4. Marketplace plugins must be approved in `.dev/marketplace/registry.yaml` before use.
5. Multi-agent delegation must keep one accountable lead agent responsible for integration and validation.
6. Advanced feature decisions must be evidence-backed and recorded when they affect risk, security, cost, or architecture.
7. Any unavailable runtime capability must be marked `UNKNOWN` or reported as blocked.

## Examples

- Good: route a security-sensitive review to `review_and_safety` and explain why.
- Good: compress a handoff into task state, constraints, decisions, validation, and open risks.
- Good: reject an unapproved plugin until its permissions and rollback path are documented.
- Bad: delegate work to several agents and merge their outputs without review.

## Validation Expectations

- `scripts/check-advanced-agent-features.sh` passes.
- Advanced modules are listed in `.dev/manifest.yaml`.
- Any concrete provider or plugin adapter mapping is non-canonical and traceable.
