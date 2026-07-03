# Promote Lessons

## Purpose

Turn recurring session lessons into durable contract rules so the system
learns instead of accumulating notes.

## Trigger

Run when `.dev/knowledge/lessons.md` exceeds roughly twenty entries, or when
the same lesson appears three times.

## Steps

1. Read `.dev/knowledge/lessons.md` and group entries by theme.
2. For each recurring theme, decide the destination:
   - Hard constraint: add to the relevant `.dev/guardrails/` file. If it is
     mechanically checkable, also add a rule to
     `.dev/hooks/guardrail-rules.json`.
   - Practice or convention: add to the relevant `.dev/standards/` file.
   - Project fact: add to the relevant `.dev/knowledge/` file.
3. Record the promotion as a decision in `.dev/build/decisions.md`.
4. Remove the promoted entries from `lessons.md`.
5. Run `make validate`.

## Guardrails

- Never promote a one-off incident into a global rule.
- Never delete a lesson without either promoting it or recording why not.
