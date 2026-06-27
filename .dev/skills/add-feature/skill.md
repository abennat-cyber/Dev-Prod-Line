# Add Feature

## Title

Add a feature using the repository contract.

## Purpose

Guide feature work through existing standards, procedures, guardrails, and knowledge.

## When To Use

Use for new behavior, interfaces, workflows, or capabilities.

## Inputs

- Feature request.
- Acceptance criteria.
- Relevant code, tests, and docs.
- `.dev/procedures/add-feature.md`.

## Principles

- Follow existing repository patterns.
- Keep scope small.
- Validate behavior.
- Update durable knowledge when facts change.

## Procedure

1. Read `.dev/knowledge/index.md`.
2. Load only task-relevant knowledge files.
3. Follow `.dev/procedures/add-feature.md`.
4. Apply standards and guardrails.
5. Implement, test, document, and report results.

## Required Outputs

- Feature implementation.
- Tests or validation notes.
- Documentation or knowledge updates when applicable.
- Summary of risks and follow-ups.

## Guardrails

- Do not invent architecture.
- Do not add unrelated refactors.
- Do not skip validation silently.

## Validation

- Run the relevant build, test, lint, or validation command when known.

## Related Files

- `.dev/procedures/add-feature.md`
- `.dev/standards/engineering.md`
- `.dev/standards/testing.md`
- `.dev/guardrails/coding.md`
