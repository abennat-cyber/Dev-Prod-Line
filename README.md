# Dev-Prod-Line

Dev-Prod-Line is a vendor-agnostic scaffold for professional agentic software development.

It defines a repository-owned engineering contract in `.dev/` and treats AI tools as adapters. The goal is to help humans and agents work from the same standards, procedures, guardrails, knowledge, workflows, evals, and validation scripts without locking the repository to Claude, Codex, Cursor, Copilot, ChatGPT, or any other specific tool.

## Core Idea

```text
.dev/ is the canonical engineering contract.
adapters/ translate the contract for specific AI tools.
agents execute the contract.
scripts validate the contract.
```

No adapter is canonical. The repository defines the standard; tools only translate it.

## What Is Included

- Canonical `.dev/` contract with manifest, standards, procedures, guardrails, knowledge, skills, evals, and build records.
- Thin adapter files for Codex, Claude, Cursor, GitHub Copilot, ChatGPT, and generic agents.
- Validation and drift-control scripts.
- Vendor-neutral advanced modules for:
  - model routing
  - token compression
  - marketplace plugin governance
  - multi-agent delegation

## Repository Layout

```text
.dev/
  manifest.yaml                  # Required files, principles, and adapter policy
  standards/                     # Engineering, testing, security, docs, observability, AI standards
  procedures/                    # Repeatable task workflows
  guardrails/                    # Hard constraints
  knowledge/                     # Lazy-loaded project knowledge
  skills/                        # Neutral agent skills
  evals/                         # Vendor-neutral behavior evals
  model-routing/                 # Capability-profile routing policy
  token-compression/             # Context compression policy and ledger
  marketplace/                   # Plugin contract and approval registry
  delegation/                    # Multi-agent roles and protocol
  build/                         # Build status, log, decisions, validation report

adapters/                        # Tool-specific compatibility layers
scripts/                         # Validation, drift, sync, and generated-file checks
```

## Quick Start

Clone the repository:

```bash
git clone https://github.com/abennat-cyber/Dev-Prod-Line.git
cd Dev-Prod-Line
```

Validate the scaffold:

```bash
scripts/validate-agentic-env.sh
scripts/check-docs-drift.sh
scripts/check-advanced-agent-features.sh
scripts/check-generated-files.sh
```

Start with these files:

- `.dev/manifest.yaml`
- `.dev/README.md`
- `.dev/knowledge/index.md`
- `.dev/procedures/`
- `.dev/guardrails/`

## Using This Scaffold In Another Repository

Use this repository as a reference implementation for creating a `.dev/` contract in another project.

When adapting it:

1. Keep `.dev/` canonical.
2. Keep adapters thin.
3. Mark unknown project facts as `UNKNOWN`.
4. Replace template knowledge with verified repository facts.
5. Run validation before committing changes.

## Contributing

Contributions are welcome. Good contributions improve the contract while preserving vendor neutrality.

Before opening a pull request:

1. Read `.dev/manifest.yaml`.
2. Use the relevant procedure in `.dev/procedures/`.
3. Follow all applicable guardrails in `.dev/guardrails/`.
4. Update knowledge or decisions when your change introduces durable facts.
5. Run the validation scripts listed in the Quick Start section.

Contribution areas that are especially useful:

- Stronger validation scripts.
- Better drift detection.
- Clearer standards and procedures.
- Additional vendor-neutral eval scenarios.
- Safer marketplace plugin governance.
- More precise multi-agent delegation protocols.

Please avoid contributions that make a specific AI tool, model provider, plugin marketplace, or agent runtime canonical.

## Design Principles

- Vendor-neutral by default.
- Repository-owned standards.
- Explicit unknowns instead of invented architecture.
- Thin adapters over duplicated instructions.
- Validation before trust.
- One accountable lead for delegated work.
- Approved plugins only.
- Capability-profile routing instead of provider-specific routing.

## Project Status

This repository is an advanced contract scaffold. It does not contain application code. Project-specific language, framework, build system, test system, deployment target, and domain model are currently `UNKNOWN` by design.

## Public Release Checklist

Before promoting this as a public community project, consider adding:

- `LICENSE`
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- issue templates
- pull request template
- security policy
- release/versioning policy

## License

No license has been specified yet. Add a `LICENSE` file before encouraging broad public reuse or external contributions.
