# Token Compression

Token compression is enabled as a vendor-neutral context management contract.

The goal is to preserve decisions, constraints, evidence, and current task state while reducing repeated or low-value context. Compression must never hide uncertainty or erase user instructions.

## Source Of Truth

- Policy: `.dev/token-compression/policy.yaml`
- Ledger: `.dev/token-compression/context-ledger.md`
- Procedure: `.dev/procedures/compress-context.md`
- Guardrails: `.dev/guardrails/token-compression.md`

## Compression Model

Agents may summarize context into durable layers:

- `task_state`: current objective, status, blockers, and next action.
- `decisions`: accepted design and implementation choices.
- `constraints`: user, security, adapter, and repository constraints.
- `evidence`: commands run, validation results, sources inspected.
- `open_questions`: unknowns and unresolved risks.

Compressed context is advisory. Canonical files and current user instructions outrank any summary.
