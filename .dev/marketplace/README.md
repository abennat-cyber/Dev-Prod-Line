# Marketplace Plugins

Marketplace plugins are enabled as a governed extension contract.

This module defines how plugins are described, reviewed, approved, installed, updated, disabled, and removed. It does not implement a vendor marketplace or require any specific plugin host.

## Source Of Truth

- Plugin contract: `.dev/marketplace/plugin-contract.yaml`
- Registry: `.dev/marketplace/registry.yaml`
- Procedure: `.dev/procedures/manage-marketplace-plugin.md`
- Guardrails: `.dev/guardrails/marketplace-plugins.md`

## Operating Model

Plugins must declare purpose, permissions, data access, provenance, versioning, risk class, owner, validation, and rollback steps before use.

The registry records approved plugins. Unknown or unapproved plugins must not be used for repository work.

## Unknowns

- Marketplace provider: `UNKNOWN`
- Runtime installation mechanism: `UNKNOWN`
- Approved plugin owners: `UNKNOWN`
