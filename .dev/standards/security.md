# Security Standard

## Purpose

Protect users, systems, credentials, sensitive data, and supply chains during development.

## Rules

1. Do not commit secrets, credentials, tokens, private keys, or production data.
2. Treat authentication, authorization, input validation, file handling, network calls, and dependency changes as security-sensitive.
3. Use least privilege for credentials, permissions, service accounts, and runtime access.
4. Validate and encode untrusted input at the correct boundary.
5. Avoid logging sensitive data.
6. Document security assumptions as `UNKNOWN` when the repository does not provide evidence.

## Examples

- Good: add validation near an API boundary and test malformed input.
- Good: update `.dev/knowledge/runbooks.md` with an incident response step once real operations exist.
- Bad: add a dependency with install scripts or broad permissions without review.

## Validation Expectations

- Security-sensitive files and flows are identified.
- Secret scanning or dependency auditing is run when available.
- Any security tradeoff is recorded in `.dev/build/decisions.md` or a project decision record.
