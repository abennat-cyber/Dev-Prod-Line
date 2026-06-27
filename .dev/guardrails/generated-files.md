# Generated Files Guardrails

1. Generated files MUST be identified through repository metadata, headers, lockfiles, or documented conventions before editing.
2. Agents MUST prefer regenerating generated artifacts from source inputs.
3. Agents MUST NOT overwrite generated artifacts without preserving existing content or confirming the generator.
4. Generated-file status MUST be marked `UNKNOWN` when evidence is missing.
5. Drift between sources and generated outputs MUST be reported rather than silently ignored.
