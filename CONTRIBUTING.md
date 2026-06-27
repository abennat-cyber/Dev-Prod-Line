# Contributing

Thanks for helping improve Dev-Prod-Line.

This repository defines a vendor-agnostic agentic development contract. Contributions should strengthen the contract without making any AI tool, model provider, plugin marketplace, or agent runtime canonical.

## Before You Start

Read:

- `.dev/manifest.yaml`
- `.dev/README.md`
- `.dev/knowledge/index.md`
- the relevant procedure in `.dev/procedures/`
- the relevant guardrails in `.dev/guardrails/`

## Contribution Workflow

1. Keep changes scoped and reviewable.
2. Mark unknown project facts as `UNKNOWN`.
3. Preserve `.dev/` as the source of truth.
4. Keep adapters thin and non-canonical.
5. Update build decisions or knowledge when a durable design choice changes.
6. Run validation before opening a pull request.

## Validation

Run:

```bash
make validate
make test-contracts
```

Or run checks individually:

```bash
scripts/validate-agentic-env.sh
scripts/check-docs-drift.sh
scripts/check-token-budget.sh
scripts/check-version.sh
scripts/check-markdown-links.sh
scripts/check-advanced-agent-features.sh
scripts/check-generated-files.sh
scripts/test-contract-validation.sh
```

If optional local dependencies for schema validation are unavailable, local validation may warn and skip schema checks. CI enforces schema validation strictly.

## Pull Requests

Pull requests should include:

- what changed
- why it changed
- validation commands and results
- any remaining risks or skipped checks

Do not include unrelated formatting churn or local-only artifacts.
