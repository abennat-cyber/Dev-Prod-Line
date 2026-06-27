# Fix Bug Procedure

## When To Use

Use when correcting behavior that is broken, risky, inconsistent, or regressed.

## Required Context

- Bug report, reproduction steps, expected behavior, and actual behavior.
- Affected code paths and tests.
- Relevant logs, traces, or user impact.

## Steps

1. Reproduce or reason from concrete evidence.
2. Identify the smallest root cause.
3. Add or update a regression test when possible.
4. Implement the fix without unrelated refactoring.
5. Validate the fix and any affected neighboring behavior.
6. Document any residual risk.

## Required Output

- Root cause summary.
- Fix summary.
- Regression coverage or explanation for missing coverage.
- Validation result.

## Validation

- The original failure no longer occurs.
- Regression tests pass when a test system exists.
- No broader behavior changes are introduced without approval.
