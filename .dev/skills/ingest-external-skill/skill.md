# Ingest External Skill

## Title

Ingest a third-party agent skill through the marketplace governance contract.

## Purpose

Adopt external SKILL.md content safely: pinned, hashed, scanned, stripped of
executable hooks, and registered before use.

## When To Use

Use whenever a skill from an external repository or marketplace is a
candidate for this repository. Never copy external skill content directly
into `.dev/skills/` without this procedure.

## Inputs

- Source repository URL, path to the skill, and a specific commit hash.
- `.dev/marketplace/plugin-contract.yaml` (required record fields).
- `scripts/ingest-skill.sh`.

## Steps

1. Run `scripts/ingest-skill.sh <repo_url> <skill_path> <commit>`. It clones
   at the pinned commit, computes the SHA-256 of the skill file, scans for
   injection markers and executable content, and stages the file under
   `.dev/skills/ingested/<name>/`.
2. Read the staged skill in full. Automated scanning reduces risk; it does
   not replace human review.
3. Remove or rewrite anything that conflicts with `.dev/guardrails/` or
   references tooling this repository does not use. Ingested skills never
   ship hooks, scripts, or binaries; only instructions.
4. Fill a plugin record in `.dev/marketplace/registry.yaml` under
   `pending_review`, including source URL, pinned commit, hash, and
   risk class per the contract.
5. Move the record to `approved_plugins` only after review per the risk
   class approval rules.

## Guardrails

- `.dev/guardrails/marketplace-plugins.md`
- `.dev/guardrails/security.md`

## Output

A reviewed skill under `.dev/skills/ingested/<name>/skill.md` and a matching
approved registry record. Anything else is not usable.
