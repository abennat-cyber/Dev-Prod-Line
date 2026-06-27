# Manage Marketplace Plugin

## Title

Review and manage marketplace plugins.

## Purpose

Govern plugin approval, installation, updates, disablement, and removal.

## When To Use

Use when a plugin or external extension is proposed, installed, updated, disabled, or removed.

## Inputs

- Plugin metadata.
- Permissions and data access.
- Source and version.
- Validation and rollback plan.
- `.dev/marketplace/plugin-contract.yaml`.

## Principles

- Unapproved plugins are not used.
- Least privilege is required.
- High-risk plugins require explicit approval and security review.
- Rollback must be documented.

## Procedure

1. Follow `.dev/procedures/manage-marketplace-plugin.md`.
2. Complete the plugin contract.
3. Classify risk.
4. Obtain required approval.
5. Update the registry.
6. Validate and record rollback.

## Required Outputs

- Plugin record or rejection.
- Risk class.
- Approval status.
- Validation and rollback notes.

## Guardrails

- `.dev/guardrails/marketplace-plugins.md`

## Validation

- Run `scripts/check-advanced-agent-features.sh` after registry or contract changes.

## Related Files

- `.dev/marketplace/plugin-contract.yaml`
- `.dev/marketplace/registry.yaml`
- `.dev/procedures/manage-marketplace-plugin.md`
