# Refactor Module Procedure

## When To Use

Use when changing internal structure while preserving external behavior.

## Required Context

- Current module responsibilities and public interfaces.
- Existing tests and validation commands.
- Known callers and integration points.

## Steps

1. Define the behavior that must remain unchanged.
2. Identify safe boundaries for the refactor.
3. Prefer incremental changes over rewrites.
4. Keep public interfaces stable unless the task explicitly changes them.
5. Run existing tests before and after when practical.
6. Document any behavior or interface changes.

## Required Output

- Refactor scope.
- Behavior preserved.
- Files changed.
- Validation result and remaining risk.

## Validation

- Existing tests pass.
- No user-visible behavior changes are introduced unintentionally.
- Documentation reflects any changed interfaces.
