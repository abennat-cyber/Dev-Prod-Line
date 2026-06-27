# Write Tests Procedure

## When To Use

Use when adding, repairing, or improving automated tests.

## Required Context

- Test framework and commands, or `UNKNOWN`.
- Behavior under test.
- Existing test style and fixtures.

## Steps

1. Inspect existing tests and conventions.
2. Choose the narrowest useful test level.
3. Cover success, failure, and boundary cases appropriate to the behavior.
4. Avoid sleeping, network dependence, or brittle timing where possible.
5. Run the relevant test command.
6. Record any gaps.

## Required Output

- Tests added or changed.
- Behavior covered.
- Command run and result.
- Uncovered risk.

## Validation

- Tests fail for the broken or missing behavior when applicable.
- Tests pass after the implementation.
- Test names describe behavior clearly.
