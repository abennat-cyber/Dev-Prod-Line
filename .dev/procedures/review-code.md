# Review Code Procedure

## When To Use

Use when reviewing a change for correctness, maintainability, security, test coverage, or operational risk.

## Required Context

- The changed files or diff.
- Relevant standards, guardrails, and knowledge.
- Intended behavior and validation results.

## Steps

1. Inspect the change in context, not only the modified lines.
2. Prioritize findings by severity and user impact.
3. Look for behavioral regressions, missing tests, security issues, and drift from standards.
4. Avoid style-only comments unless they affect maintainability or established conventions.
5. State uncertainties and assumptions.

## Required Output

- Findings first, ordered by severity.
- File and line references where possible.
- Open questions or assumptions.
- Brief summary only after findings.

## Validation

- Findings are actionable and evidence-backed.
- No canonical rules are invented outside `.dev/`.
- Test gaps and residual risks are explicit.
