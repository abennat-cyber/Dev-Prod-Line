# Data And Privacy Guardrails

1. Personal data, customer data, credentials, and proprietary data MUST be minimized in logs, tests, prompts, and reports.
2. Test fixtures MUST use synthetic or sanitized data unless real data use is explicitly approved and documented.
3. Data retention and deletion requirements MUST be respected when known.
4. Privacy-sensitive changes MUST identify collection, storage, access, sharing, and deletion impacts.
5. Unknown data classification MUST be treated conservatively.
6. Agents MUST NOT transmit private repository data to external systems unless the user explicitly requests that workflow.
