# Marketplace Plugins Guardrails

1. Plugins MUST NOT be used until approved in `.dev/marketplace/registry.yaml`.
2. Plugin permissions, data access, source, owner, version, validation, and rollback MUST be documented.
3. High-risk plugins MUST require explicit user approval and security review.
4. Plugins MUST follow least privilege.
5. Plugin installation or updates MUST be reversible or have documented disable steps.
6. Adapter-specific plugin availability MUST NOT override the canonical registry.
