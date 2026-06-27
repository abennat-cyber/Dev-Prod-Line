# Token Compression Guardrails

1. Compression MUST preserve current user instructions and explicit constraints.
2. Compression MUST preserve open risks, blockers, validation results, and meaningful decisions.
3. Compression MUST NOT hide uncertainty, failed validation, or missing approvals.
4. Sensitive data MUST be redacted rather than summarized into durable context.
5. Compressed context MUST NOT override canonical `.dev/` files.
6. Handoff compression MUST include next steps and stop conditions.
