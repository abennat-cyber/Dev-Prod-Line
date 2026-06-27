# Release Change Procedure

## When To Use

Use when preparing, validating, or documenting a release.

## Required Context

- Release scope and versioning policy, or `UNKNOWN`.
- Build, test, deployment, and rollback commands, or `UNKNOWN`.
- Changelog or release note expectations.

## Steps

1. Identify included changes and user impact.
2. Run required tests and build checks.
3. Confirm migration, compatibility, and rollback considerations.
4. Update release notes and documentation.
5. Execute release steps only when explicitly authorized.
6. Record validation and post-release follow-ups.

## Required Output

- Release scope.
- Validation result.
- Migration and rollback notes.
- Skipped or blocked release steps.

## Validation

- Required checks pass or blockers are documented.
- Release artifacts are traceable.
- Rollback path is known or marked `UNKNOWN`.
