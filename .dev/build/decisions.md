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

### 2026-06-27 - Use Apache-2.0 for public distribution

- Decision: License the repository under Apache-2.0.
- Reason: The scaffold is intended for public and enterprise adoption, and Apache-2.0 includes an explicit patent grant.

### 2026-06-27 - Enforce rigor outside the context window

- Decision: Put token budgets, schemas, link checks, and CI validation in scripts and structured files instead of repeated prompt text.
- Reason: Deterministic validation reduces context load and makes contribution checks reproducible.

### 2026-06-27 - Local-soft and CI-strict schema validation

- Decision: Local schema validation warns and skips when optional Python modules are unavailable, while CI installs dependencies and enforces schemas strictly.
- Reason: Contributors should be able to run lightweight local checks without setup friction, but invalid configs should not merge.

### 2026-06-27 - Manifest-driven validation

- Decision: `scripts/validate-agentic-env.sh` reads required file paths from `.dev/manifest.yaml`.
- Reason: The manifest must remain the single source of truth and validator duplication creates drift.

### 2026-06-27 - Deterministic validation reports

- Decision: Validation reports omit run timestamps.
- Reason: Timestamp-only diffs create contributor noise without improving contract quality.

### 2026-06-27 - Contract tests validate failure modes

- Decision: Add `scripts/test-contract-validation.sh` with intentionally broken temporary fixtures.
- Reason: Industrial validation must prove checks fail for known contract violations, not only pass on the happy path.

### 2026-06-27 - LICENSE must be verbatim Apache-2.0

- Decision: Ship the unmodified upstream Apache-2.0 text and place attribution in `NOTICE`, rather than a paraphrased license body.
- Reason: A reworded license is not OSI-recognized as Apache-2.0 and silently dropped the Section 3 patent-termination clause, defeating the patent-grant rationale for choosing Apache-2.0.

### 2026-06-27 - Ledger hygiene via structured sentinel

- Decision: Guard the committed context ledger with a `session_state: none` sentinel instead of matching specific leaked prose.
- Reason: Prose regexes are the brittle text-matching the schema/CI work is meant to retire; a sentinel is deterministic and forward-compatible.
