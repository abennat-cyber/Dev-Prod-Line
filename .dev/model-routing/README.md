# Model Routing

Model routing is enabled as a vendor-neutral contract module.

This module defines how an agent chooses a model class or capability profile for a task. It does not name, require, or prefer any AI vendor, model provider, or product.

## Source Of Truth

- Policy: `.dev/model-routing/policy.yaml`
- Evaluation matrix: `.dev/model-routing/evaluation-matrix.yaml`
- Procedure: `.dev/procedures/route-model.md`
- Guardrails: `.dev/guardrails/model-routing.md`

## Operating Model

Agents classify the task, map it to a capability profile, record the reason for the choice when material, and fall back safely when a requested capability is unavailable.

Actual provider selection is adapter-specific. Adapters may translate capability profiles to vendor-specific models, but those translations are not canonical.

## Unknowns

- Available model inventory: `UNKNOWN`
- Cost limits: `UNKNOWN`
- Latency targets: `UNKNOWN`
- Data residency constraints: `UNKNOWN`
