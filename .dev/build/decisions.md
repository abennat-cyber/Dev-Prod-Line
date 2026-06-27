# Agentic Environment Build Decisions

## Decisions

### 2026-06-27 - `.dev/` is canonical

- Decision: Treat `.dev/` as the repository-local engineering contract and all tool-specific adapter files as compatibility layers.
- Reason: The requested environment must be vendor-agnostic and must not make any AI tool canonical.

### 2026-06-27 - Unknown project facts stay explicit

- Decision: Mark project-specific facts as `UNKNOWN` when the repository does not provide evidence.
- Reason: The workspace is empty, and inventing architecture, build, test, or deployment details would create misleading guidance.

### 2026-06-27 - Keep validation conservative in the MVP

- Decision: Implement required validation and drift scripts as conservative existence and policy checks.
- Reason: The repository has no application code, generated-file conventions, build system, test system, or documentation tree to validate more deeply.

### 2026-06-27 - Do not overwrite adapter edits during sync

- Decision: `scripts/sync-agent-adapters.sh` checks existing adapters and only creates missing adapters when explicitly requested.
- Reason: Adapters are compatibility layers, and the sync MVP must not overwrite user edits.

### 2026-06-27 - Superseded MVP exclusion for advanced agent platform features

- Decision: During the MVP, model routing, token compression, marketplace plugins, and complex multi-agent delegation were deferred.
- Reason: They were out of scope for the initial build and could have made the environment more tool-platform-like than repository-contract-like.
- Superseded by: `2026-06-27 - Implement advanced features as contract modules`.

### 2026-06-27 - Implement advanced features as contract modules

- Decision: Implement model routing, token compression, marketplace plugins, and multi-agent delegation as vendor-neutral `.dev/` contract modules rather than provider-specific runtime integrations.
- Reason: The user requested these capabilities after the MVP; the repository must still define standards while AI tools remain adapters.

### 2026-06-27 - Keep one accountable lead for delegation

- Decision: Complex multi-agent delegation requires one lead agent to own scope, integration, validation, and final response.
- Reason: Delegation can reduce workstream complexity, but accountability must remain clear.

### 2026-06-27 - Marketplace registry is canonical

- Decision: `.dev/marketplace/registry.yaml` is the canonical list of approved plugins.
- Reason: Adapter-specific plugin availability is not sufficient evidence that a plugin is approved for repository work.
