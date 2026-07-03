#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <repo_url> <skill_path_in_repo> <commit>"
  exit 1
fi

REPO_URL="$1"
SKILL_PATH="$2"
COMMIT="$3"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAME="$(basename "$(dirname "$SKILL_PATH")")"
[[ "$NAME" == "." || -z "$NAME" ]] && NAME="$(basename "$SKILL_PATH" .md)"
STAGE="$ROOT_DIR/.dev/skills/ingested/$NAME"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "# Skill Ingestion"
git clone --quiet "$REPO_URL" "$TMP/src"
git -C "$TMP/src" checkout --quiet "$COMMIT"

SRC="$TMP/src/$SKILL_PATH"
if [[ ! -f "$SRC" ]]; then
  echo "FAIL: $SKILL_PATH not found at commit $COMMIT"
  exit 1
fi

HASH="$(shasum -a 256 "$SRC" 2>/dev/null || sha256sum "$SRC")"
HASH="${HASH%% *}"

echo "Scanning for risk markers..."
findings=0
for pattern in \
  "curl[^|]*| *(ba)?sh" \
  "ignore (all )?(previous|prior) instructions" \
  "disregard (the )?(system|previous)" \
  "PreToolUse|SessionStart|hooks.json" \
  "base64 -d|eval\(|os\.system"; do
  if grep -Eiq "$pattern" "$SRC"; then
    echo "  WARN: pattern matched: $pattern"
    findings=$((findings + 1))
  fi
done
[[ "$findings" -eq 0 ]] && echo "  no risk markers found (does not replace human review)"

mkdir -p "$STAGE"
cp "$SRC" "$STAGE/skill.md"

echo
echo "Staged: .dev/skills/ingested/$NAME/skill.md"
echo
echo "Registry record stub for .dev/marketplace/registry.yaml (pending_review):"
cat << STUB
  - id: "$NAME"
    name: "$NAME"
    purpose: "UNKNOWN"
    owner: "UNKNOWN"
    source:
      type: "git"
      url: "$REPO_URL"
      path: "$SKILL_PATH"
      commit: "$COMMIT"
      sha256: "$HASH"
    version: "pinned-commit"
    permissions:
      filesystem: "none"
      network: "none"
      external_services: []
    data_access:
      reads: []
      writes: []
      sensitive_data: "no"
    risk_class: "UNKNOWN"
    validation:
      install_check: "scripts/ingest-skill.sh"
      functional_check: "UNKNOWN"
      security_check: "risk-marker scan $( [[ $findings -eq 0 ]] && echo clean || echo "$findings findings" )"
    rollback: "delete .dev/skills/ingested/$NAME and remove this record"
STUB
echo
echo "Next: human review per .dev/skills/ingest-external-skill/skill.md"
