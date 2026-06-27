# ChatGPT Adapter

This file is a compatibility layer for ChatGPT.

`.dev/` is the source of truth. Follow the canonical contract in:

- `.dev/manifest.yaml`
- `.dev/standards/`
- `.dev/procedures/`
- `.dev/guardrails/`
- `.dev/knowledge/index.md`

Do not treat this adapter as canonical. Do not duplicate or override `.dev/` rules here unless ChatGPT requires a local custom instruction format.

Use project facts from `.dev/knowledge/`; mark missing facts as `UNKNOWN`.
