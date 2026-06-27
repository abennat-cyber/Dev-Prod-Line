# Update Knowledge

## Title

Update repository knowledge.

## Purpose

Keep `.dev/knowledge/` accurate as project facts are discovered or changed.

## When To Use

Use when learning durable facts about architecture, domain, local development, deployment, operations, or project decisions.

## Inputs

- Verified fact or decision.
- Source evidence.
- Relevant knowledge file.

## Principles

- `.dev/knowledge/index.md` is the default entry point.
- Load only relevant knowledge files.
- Use `UNKNOWN` for missing facts.
- Preserve decision history.

## Procedure

1. Identify the relevant knowledge file.
2. Verify the fact from code, docs, tests, tooling, or explicit user direction.
3. Update the smallest relevant section.
4. Add date, decision, context, reason, and consequences for durable decisions.
5. Run docs drift checks when available.

## Required Outputs

- Knowledge file update.
- Source or rationale for the update.
- Validation or drift check result.

## Guardrails

- Do not invent project facts.
- Do not load or rewrite unrelated knowledge files.
- Do not remove historical decisions without explanation.

## Validation

- Run `scripts/check-docs-drift.sh` when available.

## Related Files

- `.dev/knowledge/index.md`
- `.dev/knowledge/decisions.md`
- `.dev/procedures/update-docs.md`
