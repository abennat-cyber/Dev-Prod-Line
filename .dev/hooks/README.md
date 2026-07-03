# Hooks Lifecycle

Vendor-neutral lifecycle automation for the `.dev/` contract.

`.dev/` declares the rules; hooks enforce them at runtime instead of relying
on prompt text or post-hoc review.

## Model

```text
policy.yaml            # canonical events and actions
guardrail-rules.json   # machine-readable subset of .dev/guardrails/
guardrail_enforcer.py  # blocks rule violations before an edit lands
session_memory.py      # captures decisions, lessons, and telemetry at session end
```

Events are vendor-neutral names. Adapters translate them to tool-specific
hook mechanisms (for Claude Code, see `adapters/claude/hooks.json`). A tool
without a hook mechanism simply loses enforcement, not correctness: the
canonical rules remain in `.dev/guardrails/`.

## Events

| Event | Action | Failure behavior |
|---|---|---|
| `pre_edit` | Run `guardrail_enforcer.py` on the proposed content | Block the edit, print the violated rule |
| `session_end` | Run `session_memory.py` | Never blocks; best-effort capture |

## Rules of the module

- `guardrail-rules.json` is derived from `.dev/guardrails/`. The markdown
  guardrail files remain canonical; the YAML only encodes the mechanically
  checkable subset. Each rule must reference its source guardrail file.
- Hook scripts are Python 3 standard library only. No network access.
- Hooks never write outside `.dev/build/`, `.dev/knowledge/lessons.md`, and
  `.dev/telemetry/ledger.jsonl`.
