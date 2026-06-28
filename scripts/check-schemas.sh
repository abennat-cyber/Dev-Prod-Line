#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
strict="${CI:-false}"

schema_pairs=(
  ".dev/manifest.yaml|.dev/schemas/manifest.schema.json"
  ".dev/context-map.yaml|.dev/schemas/context-map.schema.json"
  ".dev/marketplace/registry.yaml|.dev/schemas/marketplace-registry.schema.json"
  ".dev/marketplace/plugin-contract.yaml|.dev/schemas/marketplace-plugin-contract.schema.json"
  ".dev/model-routing/policy.yaml|.dev/schemas/model-routing-policy.schema.json"
  ".dev/model-routing/evaluation-matrix.yaml|.dev/schemas/model-routing-evaluation-matrix.schema.json"
  ".dev/token-compression/policy.yaml|.dev/schemas/token-compression-policy.schema.json"
  ".dev/delegation/protocol.yaml|.dev/schemas/delegation-protocol.schema.json"
  ".dev/delegation/roles.yaml|.dev/schemas/delegation-roles.schema.json"
  ".dev/security/data-classification.yaml|.dev/schemas/data-classification.schema.json"
)

for eval_file in "$ROOT_DIR"/.dev/evals/*.yml; do
  schema_pairs+=("${eval_file#"$ROOT_DIR"/}|.dev/schemas/eval.schema.json")
done

if ! command -v python3 >/dev/null 2>&1; then
  if [[ "$strict" == "true" ]]; then
    echo "FAIL: python3 is required for strict schema validation"
    exit 1
  fi
  echo "WARN: python3 unavailable; skipping schema validation locally"
  exit 0
fi

python3 - "$ROOT_DIR" "$strict" "${schema_pairs[@]}" <<'PY'
import importlib.util
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
strict = sys.argv[2] == "true"
pairs = sys.argv[3:]

missing = []
for module in ("yaml", "jsonschema"):
    if importlib.util.find_spec(module) is None:
        missing.append(module)

if missing:
    message = "Missing Python modules for schema validation: " + ", ".join(missing)
    if strict:
        print("FAIL:", message)
        sys.exit(1)
    print("WARN:", message + "; skipping schema validation locally")
    sys.exit(0)

import yaml
import jsonschema

failures = 0
for pair in pairs:
    data_path, schema_path = pair.split("|", 1)
    data_file = root / data_path
    schema_file = root / schema_path
    if not data_file.exists() or not schema_file.exists():
        print(f"FAIL: Missing schema pair {data_path} / {schema_path}")
        failures += 1
        continue
    with data_file.open("r", encoding="utf-8") as fh:
        data = yaml.safe_load(fh)
    with schema_file.open("r", encoding="utf-8") as fh:
        schema = json.load(fh)
    try:
        jsonschema.validate(instance=data, schema=schema)
        print(f"OK: {data_path} validates against {schema_path}")
    except jsonschema.ValidationError as exc:
        print(f"FAIL: {data_path}: {exc.message}")
        failures += 1

sys.exit(1 if failures else 0)
PY
