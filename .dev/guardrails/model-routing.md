# Model Routing Guardrails

1. Model routing MUST use capability profiles rather than canonical vendor model names.
2. The smallest capable profile MUST be preferred unless risk, complexity, context, or validation requires escalation.
3. Routing decisions MUST NOT bypass security, privacy, or user approval constraints.
4. Provider-specific mappings MUST remain adapter-level and non-canonical.
5. Routing overrides MUST be recorded when required by `.dev/model-routing/policy.yaml`.
6. Unavailable model capabilities MUST be reported or handled with a safe fallback.
