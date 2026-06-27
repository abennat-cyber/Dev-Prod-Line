# Dependencies Guardrails

1. New dependencies MUST have a clear purpose and a smaller practical alternative must be considered.
2. Dependency versions MUST be pinned or constrained according to repository convention.
3. Lockfiles MUST be updated through the package manager when applicable.
4. Dependencies with install scripts, native code, broad permissions, or low maintenance MUST receive extra scrutiny.
5. Unused dependencies MUST NOT be added.
6. Dependency validation or audit commands MUST be run when available.
