# Multi-Agent Delegation

Complex multi-agent delegation is enabled as a governed coordination contract.

This module defines when work may be delegated, how agents coordinate, and how results are reviewed and integrated. It does not require a specific multi-agent runtime.

## Source Of Truth

- Protocol: `.dev/delegation/protocol.yaml`
- Roles: `.dev/delegation/roles.yaml`
- Procedure: `.dev/procedures/delegate-agent-work.md`
- Guardrails: `.dev/guardrails/multi-agent-delegation.md`

## Operating Model

A lead agent owns the user objective, scope, validation, and final response. Specialist agents may investigate or propose changes, but the lead agent integrates and verifies all work.

Delegation must not scatter authority. `.dev/` remains canonical and the current user request remains the highest task-specific instruction.
