#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LEDGER="$ROOT_DIR/.dev/telemetry/ledger.jsonl"

echo "# Telemetry Report"
echo

if [[ ! -s "$LEDGER" ]]; then
  echo "Ledger is empty. Records are appended by .dev/hooks/session_memory.py."
  exit 0
fi

echo "Total records: $(wc -l < "$LEDGER" | tr -d ' ')"
echo
echo "Records per event:"
python3 - "$LEDGER" << 'PY'
import collections
import json
import sys

counts = collections.Counter()
for line in open(sys.argv[1], encoding="utf-8"):
    line = line.strip()
    if not line:
        continue
    try:
        counts[json.loads(line).get("event", "UNKNOWN")] += 1
    except json.JSONDecodeError:
        counts["MALFORMED"] += 1
for event, count in counts.most_common():
    print("  {}: {}".format(event, count))
PY
