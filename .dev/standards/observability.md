# Observability Standard

## Purpose

Ensure systems can be understood, debugged, and operated when real application code exists.

## Rules

1. Prefer structured, actionable logs over noisy free-form output.
2. Include enough context to diagnose failures without exposing sensitive data.
3. Add metrics, traces, or health checks for production-critical paths when the stack supports them.
4. Make errors visible at the right boundary and include recovery guidance where possible.
5. Keep local validation output readable and deterministic.
6. Mark observability tooling as `UNKNOWN` until discovered.

## Examples

- Good: log an operation id and sanitized error code for a failed background job.
- Good: add a runbook entry for a recurring incident.
- Bad: log raw request bodies that may include personal or credential data.

## Validation Expectations

- New operational paths include appropriate logging or error reporting.
- Sensitive values are not logged.
- Any missing observability is documented as a risk.
