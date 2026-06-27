# Route Model

## Title

Route work to a vendor-neutral capability profile.

## Purpose

Choose the smallest capable model profile without making any provider canonical.

## When To Use

Use before work where task complexity, risk, context size, tool requirements, or validation expectations materially affect model choice.

## Inputs

- Task description.
- Risk and complexity assessment.
- `.dev/model-routing/policy.yaml`.
- `.dev/model-routing/evaluation-matrix.yaml`.

## Principles

- Route by capability, not vendor.
- Escalate only when justified.
- Record material overrides.
- Keep provider mapping in adapters.

## Procedure

1. Follow `.dev/procedures/route-model.md`.
2. Classify the task.
3. Select a capability profile.
4. Record required routing decisions.
5. Report unavailable capabilities.

## Required Outputs

- Selected profile.
- Reasoning for non-default choices.
- Fallback or blocker if capability is unavailable.

## Guardrails

- `.dev/guardrails/model-routing.md`

## Validation

- Run `scripts/check-advanced-agent-features.sh` when changing routing policy.

## Related Files

- `.dev/model-routing/policy.yaml`
- `.dev/model-routing/evaluation-matrix.yaml`
- `.dev/procedures/route-model.md`
