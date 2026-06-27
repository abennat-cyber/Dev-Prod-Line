# Agentic Development Contract

`.dev/` is the canonical engineering contract for the repository.

AI tools are adapters. They may read and translate this contract, but they do not own it. The source of truth is `.dev/`.

## Contract Model

- `.dev/` defines standards, procedures, guardrails, knowledge, workflows, skills, evals, and build records.
- `adapters/` contains thin compatibility files for specific AI tools.
- `agents` execute the contract by following the relevant standards, procedures, guardrails, and knowledge entry points.
- `scripts` validate the contract and check for drift.
- Advanced modules define model routing, token compression, marketplace plugins, and multi-agent delegation without making any vendor canonical.

## Entry Points

- Start with `.dev/manifest.yaml` for the required structure and adapter policy.
- Use `.dev/knowledge/index.md` as the default knowledge entry point.
- Select one procedure from `.dev/procedures/` for the task at hand.
- Apply all relevant hard constraints from `.dev/guardrails/`.
- Validate with `scripts/validate-agentic-env.sh`.

## Advanced Modules

- Model routing: `.dev/model-routing/`
- Token compression: `.dev/token-compression/`
- Marketplace plugins: `.dev/marketplace/`
- Multi-agent delegation: `.dev/delegation/`

Validate advanced modules with `scripts/check-advanced-agent-features.sh`.

## Repository Facts

Current project-specific facts are `UNKNOWN` because no application files existed during initial setup. Update `.dev/knowledge/` and `.dev/build/decisions.md` as the repository gains real architecture, build, test, deployment, and operational details.
