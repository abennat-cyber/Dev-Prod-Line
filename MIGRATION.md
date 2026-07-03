# Migration Guide

How to move a consumer repository between contract versions. Each section
lists what changed, what is required, and what is optional.

## 1.1.0 to 1.2.0

Backward compatible. No existing file changed meaning; four modules were added.

Required actions: none. Existing consumers remain valid.

Optional adoption, in recommended order:

1. Hooks lifecycle (`.dev/hooks/`): copy the module, then wire your tool via
   its adapter (Claude Code: `adapters/claude/hooks.json`). This moves
   guardrail enforcement from review time to tool-call time.
2. Telemetry (`.dev/telemetry/`): copy the module. The session_end hook
   populates the ledger automatically once hooks are wired.
3. Runnable evals: copy `scripts/run-evals.sh` and add `automated_checks`
   to any eval with a mechanically verifiable outcome.
4. Ingestion governance: copy `.dev/skills/ingest-external-skill/` and
   `scripts/ingest-skill.sh` before adopting any third-party skill.
5. Drift detection: copy `scripts/check-contract-version.sh` and run it
   periodically against the upstream scaffold.

## General rules

- Never take a contract update that skips a MAJOR version without reading
  every intermediate section here.
- Update `.dev/VERSION`, `manifest.yaml` `schema_version`, and CHANGELOG.md
  together, then run `make validate`.
