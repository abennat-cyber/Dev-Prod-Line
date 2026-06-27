# Multi-Agent Delegation Guardrails

1. One lead agent MUST own task scope, integration, validation, and final response.
2. Delegated tasks MUST have bounded scope, required outputs, validation expectations, and stop conditions.
3. Delegates MUST receive only the context required for their task.
4. Delegate output MUST be reviewed before integration.
5. Conflicting delegate outputs MUST be resolved by the lead agent.
6. Delegation MUST NOT be used to avoid required user confirmation.
7. Delegation MUST NOT obscure accountability for security-sensitive actions.
