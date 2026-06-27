# GitHub Copilot Adapter

This file is a compatibility layer for GitHub Copilot.

`.dev/` is the source of truth. Follow the canonical contract in:

- `.dev/manifest.yaml`
- `.dev/standards/`
- `.dev/procedures/`
- `.dev/guardrails/`
- `.dev/knowledge/index.md`

Do not treat this adapter as canonical. Do not duplicate or override `.dev/` rules here unless GitHub Copilot requires a local instruction format.

Agents must validate changes with repository scripts when available and report any unavailable validation.
