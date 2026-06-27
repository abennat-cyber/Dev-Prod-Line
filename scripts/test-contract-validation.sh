#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

pass_count=0

new_fixture() {
  name="$1"
  target="$tmpdir/$name"
  "$ROOT_DIR/scripts/init-dev-contract.sh" "$target" --allow-non-git >/dev/null
  printf '%s\n' "$target"
}

expect_fail() {
  name="$1"
  shift
  if "$@" >/tmp/dev-contract-test.out 2>&1; then
    echo "FAIL: $name unexpectedly passed"
    cat /tmp/dev-contract-test.out
    exit 1
  fi
  echo "OK: $name failed as expected"
  pass_count=$((pass_count + 1))
}

expect_pass() {
  name="$1"
  shift
  "$@" >/tmp/dev-contract-test.out 2>&1
  echo "OK: $name passed"
  pass_count=$((pass_count + 1))
}

baseline="$(new_fixture baseline)"
expect_pass "baseline validation" bash -c "cd '$baseline' && scripts/validate-agentic-env.sh"

missing_adapter="$(new_fixture missing-adapter)"
rm -f "$missing_adapter/adapters/generic/AGENT.md"
expect_fail "missing adapter" bash -c "cd '$missing_adapter' && scripts/validate-agentic-env.sh"

stale_ledger="$(new_fixture stale-ledger)"
sed -i.bak 's/session_state: none/session_state: active/' "$stale_ledger/.dev/token-compression/context-ledger.md"
expect_fail "stale context ledger" bash -c "cd '$stale_ledger' && scripts/check-token-budget.sh"

broken_link="$(new_fixture broken-link)"
printf '\n[Broken](missing-file.md)\n' >> "$broken_link/README.md"
expect_fail "broken markdown link" bash -c "cd '$broken_link' && scripts/check-markdown-links.sh"

over_budget="$(new_fixture over-budget)"
python3 - "$over_budget/.dev/context-map.yaml" <<'PY'
import pathlib
import sys

path = pathlib.Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
path.write_text(text.replace("max_estimated_tokens: 1900", "max_estimated_tokens: 1", 1), encoding="utf-8")
PY
expect_fail "over-budget eager context" bash -c "cd '$over_budget' && scripts/check-token-budget.sh"

echo "Contract validation tests passed: $pass_count"
