# Global Guardrails

1. `.dev/` MUST remain the canonical engineering contract.
2. Adapter files MUST NOT become the source of truth.
3. Agents MUST preserve existing user work.
4. Agents MUST NOT perform destructive operations without explicit user authorization.
5. Unknown project facts MUST be written as `UNKNOWN`.
6. Agents MUST validate changes or clearly state why validation was unavailable.
7. Durable decisions MUST be recorded in `.dev/build/decisions.md` during environment setup or `.dev/knowledge/decisions.md` for project decisions.
8. Advanced features MUST remain governed by canonical `.dev/` modules and MUST NOT make any adapter canonical.
