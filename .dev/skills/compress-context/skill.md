# Compress Context

## Title

Compress task context safely.

## Purpose

Reduce repeated context while preserving instructions, constraints, evidence, validation, and unresolved risk.

## When To Use

Use during long tasks, handoffs, delegation, or major phase transitions.

## Inputs

- Current objective.
- Constraints and approvals.
- Decisions and evidence.
- Validation results.
- `.dev/token-compression/policy.yaml`.

## Principles

- Preserve what matters.
- Redact sensitive data.
- Separate facts from assumptions.
- Never override canonical `.dev/` files.

## Procedure

1. Follow `.dev/procedures/compress-context.md`.
2. Choose a compression level.
3. Preserve required fields.
4. Update the context ledger only for durable context.
5. Verify unknowns and risks remain explicit.

## Required Outputs

- Compressed state.
- Decisions and constraints.
- Validation summary.
- Open questions and risks.

## Guardrails

- `.dev/guardrails/token-compression.md`

## Validation

- Run `scripts/check-advanced-agent-features.sh` when changing compression policy.

## Related Files

- `.dev/token-compression/policy.yaml`
- `.dev/token-compression/context-ledger.md`
- `.dev/procedures/compress-context.md`
