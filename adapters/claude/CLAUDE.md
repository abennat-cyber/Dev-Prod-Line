# Claude Adapter

This file is a compatibility layer for Claude.

`.dev/` is the source of truth. Follow the canonical contract in:

- `.dev/manifest.yaml`
- `.dev/standards/`
- `.dev/procedures/`
- `.dev/guardrails/`
- `.dev/knowledge/index.md`

Do not treat this adapter as canonical. Do not duplicate or override `.dev/` rules here unless Claude requires a local instruction format.

Use `.dev/knowledge/index.md` as the default knowledge entry point and load only task-relevant knowledge files.

## Hooks

Wire `.dev/hooks/policy.yaml` using `adapters/claude/hooks.json`: copy its
`hooks` block into `.claude/settings.json`. The canonical events, rules, and
scripts live in `.dev/hooks/`; this adapter only translates them.
