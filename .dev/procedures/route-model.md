# Route Model Procedure

## When To Use

Use when choosing a model class, capability profile, or adapter execution mode for a task.

## Required Context

- Task type, risk level, context size, security sensitivity, required tools, and validation needs.
- `.dev/model-routing/policy.yaml`.
- Available adapter capabilities, or `UNKNOWN`.

## Steps

1. Classify the task using `.dev/model-routing/evaluation-matrix.yaml`.
2. Select the smallest capable profile from `.dev/model-routing/policy.yaml`.
3. Escalate only when complexity, risk, context, or validation requires it.
4. Record the decision when required by the routing policy.
5. If a provider-specific mapping is needed, keep it in the adapter layer and mark it non-canonical.
6. Fall back to safe read-only or ask the user when required capabilities are unavailable.

## Required Output

- Selected capability profile.
- Reason for selection when material.
- Any unavailable capability or fallback.
- Validation expectations.

## Validation

- The selected profile is supported by policy.
- No provider-specific model is made canonical.
- Escalation or override decisions are recorded when required.
