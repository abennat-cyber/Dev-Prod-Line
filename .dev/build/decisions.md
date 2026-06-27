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

### 2026-06-27 - Exclude advanced agent platform features

- Decision: Do not implement model routing, token compression, marketplace plugins, or complex multi-agent delegation.
- Reason: These features are explicitly out of scope for the MVP and would make the environment more tool-platform-like than repository-contract-like.
