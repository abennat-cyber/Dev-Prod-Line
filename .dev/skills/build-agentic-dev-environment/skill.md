# Build Agentic Development Environment

## Title

Build or update a vendor-agnostic agentic development environment.

## Purpose

Create or maintain a repository-local `.dev/` contract, thin AI tool adapters, validation scripts, drift checks, evals, and build records.

## When To Use

Use when a repository needs a professional agentic development environment that is not locked to Claude, Codex, Cursor, Copilot, ChatGPT, or any specific AI tool.

## Inputs

- Repository root.
- Existing project files and documentation.
- User requirements for agent behavior.
- Existing adapter files, if any.

## Principles

- `.dev/` is the canonical engineering contract.
- `adapters/` translate the contract for specific tools.
- Agents execute the contract.
- Scripts validate the contract.
- No adapter is canonical.
- Unknown project facts are marked `UNKNOWN`.

## Procedure

1. Create `.dev/build/status.md`, `.dev/build/log.md`, and `.dev/build/decisions.md` immediately.
2. Discover the repository language, framework, build system, test system, documentation, agent files, CI, generated files, security-sensitive areas, and modification risks.
3. Record discovery results in `.dev/build/log.md`.
4. Create or update `.dev/manifest.yaml` and `.dev/README.md`.
5. Create or update standards, procedures, guardrails, knowledge, workflows, neutral skills, adapters, validation scripts, and evals.
6. Preserve existing files; if updating an existing file, retain useful content or migrate it into canonical `.dev/` files.
7. Record meaningful design choices in `.dev/build/decisions.md`.
8. Run `scripts/validate-agentic-env.sh`.
9. Update `.dev/build/status.md`, `.dev/build/log.md`, and `.dev/build/validation-report.md`.

## Required Outputs

- Complete `.dev/` contract.
- Thin adapters under `adapters/`.
- Validation and drift-control scripts under `scripts/`.
- Evals under `.dev/evals/`.
- Build status, log, decisions, and validation report.
- Final summary of completed phases, changed files, validation result, skipped items, and risks.

## Guardrails

- Do not make destructive changes.
- Do not overwrite existing files without preserving their content.
- Do not invent project-specific architecture.
- Implement model routing, token compression, marketplace plugins, and multi-agent delegation only as vendor-neutral contract modules unless the repository explicitly adds runtime adapters.
- Do not make any adapter canonical.

## Validation

- Run `scripts/validate-agentic-env.sh`.
- Confirm required files exist.
- Confirm adapters state that `.dev/` is the source of truth.
- Confirm advanced feature modules pass `scripts/check-advanced-agent-features.sh` when present.
- Confirm validation report is generated.

## Related Files

- `.dev/manifest.yaml`
- `.dev/build/status.md`
- `.dev/build/log.md`
- `.dev/build/decisions.md`
- `scripts/validate-agentic-env.sh`
