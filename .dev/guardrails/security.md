# Security Guardrails

1. Secrets, credentials, private keys, tokens, and production data MUST NOT be committed.
2. Authentication and authorization changes MUST receive explicit security review.
3. Untrusted input MUST be validated at the appropriate boundary.
4. Sensitive data MUST NOT be logged, echoed, or included in generated reports.
5. Dependency changes MUST be reviewed for source, license, maintenance, and security risk.
6. Security assumptions MUST be documented when evidence is incomplete.
7. Incident evidence MUST be preserved and sanitized before sharing.
