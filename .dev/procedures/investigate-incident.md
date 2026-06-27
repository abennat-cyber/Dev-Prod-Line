# Investigate Incident Procedure

## When To Use

Use when diagnosing production, staging, CI, data, security, or operational incidents.

## Required Context

- Incident timeline, impact, and affected systems.
- Logs, metrics, traces, alerts, and recent changes, or `UNKNOWN`.
- Safety constraints for data, credentials, and user impact.

## Steps

1. Stabilize and preserve evidence before making changes.
2. Establish timeline and impact.
3. Identify recent changes and likely failure domains.
4. Test hypotheses with evidence.
5. Record mitigations, fixes, and follow-ups.
6. Update runbooks and knowledge after resolution.

## Required Output

- Impact summary.
- Evidence reviewed.
- Root cause or current hypothesis.
- Mitigation, fix, and follow-up items.

## Validation

- Claims are supported by evidence.
- Sensitive information is redacted.
- Runbooks are updated when durable operations knowledge changes.
