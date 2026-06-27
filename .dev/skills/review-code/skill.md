# Review Code

## Title

Review code using the repository contract.

## Purpose

Find actionable correctness, security, maintainability, test, and operational issues.

## When To Use

Use for pull requests, patches, proposed changes, or local diffs.

## Inputs

- Diff or changed files.
- Intended behavior.
- Validation results.
- `.dev/procedures/review-code.md`.

## Principles

- Findings first.
- Evidence over preference.
- Severity reflects user impact.
- Avoid duplicating canonical rules in adapters.

## Procedure

1. Read `.dev/knowledge/index.md`.
2. Load relevant standards, guardrails, and knowledge.
3. Inspect changes in context.
4. Report actionable findings with file references.
5. State open questions and test gaps.

## Required Outputs

- Ordered findings.
- Open questions or assumptions.
- Brief summary after findings.
- Test gaps and residual risk.

## Guardrails

- Do not focus on style-only issues unless they affect maintainability or established convention.
- Do not claim facts without evidence.

## Validation

- Confirm each finding is reproducible, reasoned from code, or clearly marked as a risk.

## Related Files

- `.dev/procedures/review-code.md`
- `.dev/standards/security.md`
- `.dev/standards/testing.md`
