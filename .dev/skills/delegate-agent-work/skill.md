# Delegate Agent Work

## Title

Delegate bounded work across multiple agents.

## Purpose

Coordinate complex multi-agent work while preserving accountability, validation, and user intent.

## When To Use

Use when a task has separable workstreams and a lead agent can verify and integrate the result.

## Inputs

- User objective.
- Workstream boundaries.
- Required outputs.
- Relevant files and constraints.
- `.dev/delegation/protocol.yaml`.

## Principles

- One lead agent remains accountable.
- Delegates get bounded tasks.
- Delegate output is reviewed before integration.
- User confirmations are not bypassed.

## Procedure

1. Follow `.dev/procedures/delegate-agent-work.md`.
2. Confirm delegation is allowed.
3. Assign roles and bounded tasks.
4. Review delegate output.
5. Integrate and validate.
6. Report residual risks.

## Required Outputs

- Delegation plan.
- Delegate findings or outputs.
- Integration summary.
- Validation result.

## Guardrails

- `.dev/guardrails/multi-agent-delegation.md`

## Validation

- Run `scripts/check-advanced-agent-features.sh` when delegation protocol changes.

## Related Files

- `.dev/delegation/protocol.yaml`
- `.dev/delegation/roles.yaml`
- `.dev/procedures/delegate-agent-work.md`
