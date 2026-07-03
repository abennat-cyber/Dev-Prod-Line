# Changelog

All notable changes to the `.dev/` engineering contract are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Versioning policy

This project versions the **contract**, not application code, using semantic
versioning of `.dev/manifest.yaml`'s `schema_version`:

- MAJOR: a breaking change to the contract structure, required files, or
  adapter policy that existing consumers must act on.
- MINOR: a backward-compatible addition (new optional module, standard,
  procedure, guardrail, eval, or script).
- PATCH: clarifications, wording, or non-structural fixes.

Bump `schema_version` in the same change that alters the contract, and add a
matching entry below.

## [1.2.0] - 2026-07-03

### Added

- Hooks lifecycle module (`.dev/hooks/`): vendor-neutral event policy,
  machine-readable guardrail rules, pre-edit enforcement script, and
  session-end memory capture. Claude Code reference adapter in
  `adapters/claude/hooks.json`.
- Telemetry module (`.dev/telemetry/`): append-only JSONL run ledger,
  schema, and `scripts/telemetry-report.sh`.
- Runnable evals: `scripts/run-evals.sh` executes optional
  `automated_checks` declared in eval files; token-compression and
  marketplace evals now carry automated checks.
- Adapter conformance suite: `.dev/evals/conformance-tasks.yaml` and
  `.dev/evals/conformance-matrix.md`.
- External skill ingestion governance: `.dev/skills/ingest-external-skill/`
  and `scripts/ingest-skill.sh` (pinned commit, SHA-256, risk-marker scan,
  registry record stub).
- Release discipline: `MIGRATION.md` and `scripts/check-contract-version.sh`
  for consumer-side drift detection.
- Knowledge learning loop: `.dev/knowledge/lessons.md` populated by the
  session-end hook, with promotion procedure.

## [Unreleased]

## [1.1.0] - 2026-06-27

### Added

- Apache-2.0 `LICENSE` (verbatim upstream text) and `NOTICE`.
- This `CHANGELOG.md` and contract-versioning policy.
- Manifest-driven validation, deterministic validation reports, and `Makefile` entry points.
- Contract validation tests and safer installer options.
- Data classification policy and broader JSON Schema coverage.

## [1.0.0] - 2026-06-27

### Added

- Canonical `.dev/` contract: manifest, standards, procedures, guardrails,
  knowledge, skills, evals, workflows, and build records.
- Vendor-neutral advanced modules: model routing, token compression,
  marketplace plugin governance, and multi-agent delegation.
- Thin adapters for Codex, Claude, Cursor, GitHub Copilot, ChatGPT, and a
  generic agent.
- Distribution hardening: machine-readable JSON Schemas under `.dev/schemas/`,
  an eager/lazy context map with an enforced token budget
  (`.dev/context-map.yaml`), markdown link-integrity and schema validation
  scripts, a CI workflow, contribution and security docs, and an installer
  (`scripts/init-dev-contract.sh`).
