# Telemetry

Run ledger for agent-assisted work. Industrial means measurable: cost per
task, rework rate, and eval pass rate come from this ledger, not from memory.

## Ledger

`ledger.jsonl` is append-only JSONL, one record per event, written by
`.dev/hooks/session_memory.py` (session summaries) and optionally by adapters
(per-tool-call records). Schema: `.dev/schemas/telemetry-ledger.schema.json`.

Core fields: `ts`, `event`, and event-specific fields such as `usage`
(tokens, model), `decisions`, `lessons`, `result`.

## Reporting

`scripts/telemetry-report.sh` aggregates the ledger into counts per event
type and total sessions. Extend it in consumer repositories as metrics
mature; keep raw records untouched.

## Rules

- Append-only. Never rewrite history.
- No personal data, credentials, or client-identifying content in records.
  See `.dev/guardrails/data-and-privacy.md`.
- Unknown values are omitted, not invented.
