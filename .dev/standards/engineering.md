# Engineering Standard

## Purpose

Define baseline expectations for maintainable, reviewable, production-quality engineering work.

## Rules

1. Prefer the repository's existing architecture, style, naming, and ownership boundaries.
2. Keep changes scoped to the requested behavior and avoid unrelated refactors.
3. Make behavior explicit through code, tests, documentation, or configuration rather than hidden convention.
4. Preserve user work and existing files; do not overwrite content without retaining or migrating it.
5. Mark missing project facts as `UNKNOWN` instead of inventing them.
6. Choose boring, well-supported dependencies and patterns unless the repository has a documented reason otherwise.

## Examples

- Good: add a small helper next to existing related code and cover it with focused tests.
- Good: document a missing deployment fact as `UNKNOWN` in `.dev/knowledge/deployment.md`.
- Bad: introduce a new framework or directory structure without evidence that the project needs it.

## Validation Expectations

- The change is small enough to review.
- Existing behavior is preserved unless the task explicitly changes it.
- Relevant tests, docs, or knowledge files are updated.
- Validation commands and results are recorded in the final response or build log.
