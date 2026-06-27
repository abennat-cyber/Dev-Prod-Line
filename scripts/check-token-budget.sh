#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MAP="$ROOT_DIR/.dev/context-map.yaml"
failures=0

estimate_tokens() {
  file="$1"
  bytes="$(wc -c < "$file" | tr -d ' ')"
  awk -v b="$bytes" 'BEGIN { print int((b + 3) / 4) }'
}

if [[ ! -f "$MAP" ]]; then
  echo "MISSING: .dev/context-map.yaml"
  exit 1
fi

echo "# Token Budget Check"
echo

total_budget="$(awk '/total_eager_budget:/ { in_total=1; next } in_total && /max_estimated_tokens:/ { print $2; exit }' "$MAP")"
if [[ -z "$total_budget" ]]; then
  echo "FAIL: total eager budget is missing"
  failures=$((failures + 1))
  total_budget=0
fi

total_estimate=0
while IFS='|' read -r path budget; do
  [[ -z "$path" ]] && continue
  file="$ROOT_DIR/$path"
  if [[ ! -f "$file" ]]; then
    echo "MISSING: $path"
    failures=$((failures + 1))
    continue
  fi
  estimate="$(estimate_tokens "$file")"
  total_estimate=$((total_estimate + estimate))
  if [[ "$estimate" -gt "$budget" ]]; then
    echo "FAIL: $path estimated $estimate tokens exceeds budget $budget"
    failures=$((failures + 1))
  else
    echo "OK: $path estimated $estimate / $budget tokens"
  fi
done < <(awk '
  /eager_context:/ { in_eager=1; next }
  /lazy_context:/ { in_eager=0 }
  in_eager && /- path:/ {
    path=$3
    gsub(/"/, "", path)
  }
  in_eager && /max_estimated_tokens:/ {
    print path "|" $2
  }
' "$MAP")

echo
echo "Total eager estimate: $total_estimate / $total_budget tokens"
if [[ "$total_budget" -gt 0 && "$total_estimate" -gt "$total_budget" ]]; then
  echo "FAIL: total eager estimate exceeds budget"
  failures=$((failures + 1))
fi

ledger="$ROOT_DIR/.dev/token-compression/context-ledger.md"
if [[ -f "$ledger" ]]; then
  if grep -q 'session_state: none' "$ledger"; then
    echo "OK: context ledger sentinel is session_state: none"
  else
    echo "FAIL: context ledger missing 'session_state: none' sentinel (active session state must not be committed)"
    failures=$((failures + 1))
  fi
fi

if [[ "$failures" -gt 0 ]]; then
  exit 1
fi

echo "Token budget check passed."
