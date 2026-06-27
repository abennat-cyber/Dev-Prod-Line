# Codex Adapter

This file is a compatibility layer for Codex.

`.dev/` is the source of truth. Follow the canonical contract in:

- `.dev/manifest.yaml`
- `.dev/standards/`
- `.dev/procedures/`
- `.dev/guardrails/`
- `.dev/knowledge/index.md`

Do not treat this adapter as canonical. Do not duplicate or override `.dev/` rules here unless Codex requires a local instruction format.

Before making changes, select the relevant procedure, load only relevant knowledge files, apply guardrails, and validate with repository scripts when available.
