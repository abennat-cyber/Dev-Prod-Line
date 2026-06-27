.PHONY: validate ci schemas test-contracts

validate:
	scripts/validate-agentic-env.sh
	scripts/check-docs-drift.sh
	scripts/check-token-budget.sh
	scripts/check-version.sh
	scripts/check-markdown-links.sh
	scripts/check-advanced-agent-features.sh
	scripts/check-generated-files.sh

schemas:
	scripts/check-schemas.sh

test-contracts:
	scripts/test-contract-validation.sh

ci:
	CI=true scripts/check-schemas.sh
	$(MAKE) validate
	$(MAKE) test-contracts
