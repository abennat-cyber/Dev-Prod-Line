# Manage Marketplace Plugin Procedure

## When To Use

Use when evaluating, approving, installing, updating, disabling, or removing a plugin from any marketplace or external extension source.

## Required Context

- Plugin purpose, source, owner, version, permissions, data access, risk class, validation, and rollback.
- `.dev/marketplace/plugin-contract.yaml`.
- `.dev/marketplace/registry.yaml`.

## Steps

1. Capture plugin metadata using the plugin contract.
2. Classify risk as low, medium, or high.
3. Review permissions, external access, data handling, and supply-chain risk.
4. Obtain required approval for the risk class.
5. Add approved plugins to `.dev/marketplace/registry.yaml`.
6. Validate installation or update.
7. Record rollback or disable steps.

## Required Output

- Plugin record or rejection reason.
- Risk class and approval status.
- Validation result.
- Rollback instructions.

## Validation

- Unapproved plugins are not used.
- High-risk plugins have explicit approval and security review.
- Registry state matches actual allowed usage.
