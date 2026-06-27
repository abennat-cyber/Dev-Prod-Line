# Testing Standard

## Purpose

Ensure changes are verified at the right level with reliable, maintainable tests.

## Rules

1. Identify the existing test system before adding tests; if none exists, mark it `UNKNOWN`.
2. Add or update tests for changed behavior, bug fixes, and risky refactors.
3. Prefer focused unit tests for isolated logic and integration tests for cross-boundary behavior.
4. Avoid brittle assertions that depend on incidental implementation details.
5. Never remove failing tests to make validation pass unless the test is demonstrably obsolete and the reason is documented.
6. Record tests that could not be run and why.

## Examples

- Good: add a regression test that fails before a bug fix and passes after it.
- Good: note "test command UNKNOWN" when no package metadata exists.
- Bad: validate a production behavior only by manually reading code.

## Validation Expectations

- A relevant automated test command is run when available.
- Manual validation is documented when automation is unavailable.
- Test gaps and residual risk are stated clearly.
