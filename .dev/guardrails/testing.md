# Testing Guardrails

1. Behavior changes MUST include automated tests when a test system exists and the behavior is testable.
2. Bug fixes SHOULD include regression tests that fail before the fix when practical.
3. Tests MUST be deterministic and avoid unnecessary network, time, or environment dependence.
4. Failing tests MUST NOT be deleted or weakened without documented justification.
5. Validation commands and outcomes MUST be reported.
6. Missing test infrastructure MUST be marked `UNKNOWN` or documented as unavailable.
