# Update Docs Procedure

## When To Use

Use when repository behavior, setup, interfaces, decisions, or operations need documentation changes.

## Required Context

- Audience and documentation location.
- Source of truth for the documented behavior.
- Existing docs structure.

## Steps

1. Identify the authoritative source.
2. Update the smallest relevant document.
3. Use `UNKNOWN` for missing facts.
4. Keep instructions executable and concise.
5. Update decision records when documenting a meaningful choice.
6. Run drift checks when available.

## Required Output

- Documents changed.
- Facts added or corrected.
- Validation or drift check result.

## Validation

- Commands, links, and file references are checked where practical.
- Documentation does not contradict `.dev/manifest.yaml`.
- Durable knowledge belongs in `.dev/knowledge/`.
