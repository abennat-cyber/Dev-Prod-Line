# AI-Assisted Engineering Standard

## Purpose

Define how AI agents and assistants should work in this repository without becoming the source of truth.

## Rules

1. `.dev/` is canonical; adapters only translate the contract.
2. Agents must read the relevant procedure, standards, guardrails, and `.dev/knowledge/index.md` before acting.
3. Agents must preserve existing work and avoid destructive commands.
4. Agents must distinguish evidence from inference.
5. Agents must validate changes with repository scripts or explain why validation was unavailable.
6. Agents must update knowledge and decisions when they learn durable facts.
7. Agents must not implement model routing, token compression, marketplace plugins, or complex multi-agent delegation in this MVP.

## Examples

- Good: "Build system is UNKNOWN; no package manifest exists."
- Good: a Codex adapter points to `.dev/` without duplicating all rules.
- Bad: a Claude or Cursor file redefines engineering standards differently from `.dev/standards/`.

## Validation Expectations

- Adapter files state that `.dev/` is the source of truth.
- Validation scripts pass.
- Build logs and decision records capture meaningful setup choices.
