# Add Feature Procedure

## When To Use

Use when adding new user-visible or developer-visible behavior.

## Required Context

- Feature request and acceptance criteria.
- Existing related code, tests, documentation, and ownership boundaries.
- Build and test commands, or `UNKNOWN`.
- Security, privacy, and migration implications.

## Steps

1. Confirm the desired behavior and scope.
2. Locate existing patterns before adding new abstractions.
3. Implement the smallest coherent change.
4. Add or update tests for new behavior.
5. Update relevant documentation and knowledge files.
6. Run validation and record results.

## Required Output

- Summary of behavior added.
- Files changed.
- Tests or validation run.
- Known limitations or follow-up work.

## Validation

- New behavior is covered by automated tests where available.
- Existing validation still passes.
- Documentation and `.dev/knowledge/` are updated if durable facts changed.
