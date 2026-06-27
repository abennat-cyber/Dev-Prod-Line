# Generic Agent Adapter

This file is a compatibility layer for any agentic development tool.

`.dev/` is the source of truth. Follow the canonical contract in:

- `.dev/manifest.yaml`
- `.dev/standards/`
- `.dev/procedures/`
- `.dev/guardrails/`
- `.dev/knowledge/index.md`

Do not treat this adapter as canonical. Do not duplicate or override `.dev/` rules here unless the target tool requires a local instruction format.

Agents execute the contract. Scripts validate the contract.
