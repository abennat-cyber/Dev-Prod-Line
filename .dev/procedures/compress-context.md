# Compress Context Procedure

## When To Use

Use during long-running work, handoffs, delegation, or phase transitions where repeated context should be compacted.

## Required Context

- Current user objective.
- Explicit constraints and approvals.
- Files changed, commands run, validation results, blockers, and risks.
- `.dev/token-compression/policy.yaml`.

## Steps

1. Choose a compression level: light, standard, or handoff.
2. Preserve current request, constraints, canonical rules, decisions, evidence, validation, and open risks.
3. Redact sensitive values.
4. Separate facts, assumptions, and unknowns.
5. Update `.dev/token-compression/context-ledger.md` only for durable context.
6. Verify that compressed context does not contradict canonical files.

## Required Output

- Compressed task state.
- Preserved decisions and constraints.
- Evidence and validation summary.
- Open questions and risks.

## Validation

- Required preservation fields are present.
- Unknowns remain explicit.
- Sensitive data is absent or redacted.
