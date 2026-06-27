# Documentation Standard

## Purpose

Keep repository knowledge useful, current, and close to the work it explains.

## Rules

1. Update documentation when behavior, setup, interfaces, operations, or decisions change.
2. Keep canonical agent-facing knowledge in `.dev/knowledge/`.
3. Use `UNKNOWN` for missing facts instead of speculative prose.
4. Link to source files, scripts, or external references when they are authoritative.
5. Prefer concise procedural documentation over broad essays.
6. Preserve historical decisions; append new context instead of rewriting history without reason.

## Examples

- Good: add a local development command after confirming it works.
- Good: append a decision with date, choice, reason, and consequences.
- Bad: describe a deployment platform that does not exist in the repository.

## Validation Expectations

- Documentation changed with behavior when appropriate.
- Links and commands are checked where practical.
- Drift checks pass or report known TODOs.
