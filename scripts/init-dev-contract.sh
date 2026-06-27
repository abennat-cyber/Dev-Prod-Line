#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET=""
FORCE="false"
DRY_RUN="false"
CHECK_ONLY="false"
ALLOW_NON_GIT="false"
copied=0
backed_up=0

usage() {
  cat <<'USAGE'
Usage: scripts/init-dev-contract.sh <target-repository> [--force] [--dry-run] [--check] [--allow-non-git]

Copies the vendor-agnostic .dev contract, validation scripts, adapters, and public contribution files into another repository.

Safety:
- Existing files are not overwritten by default.
- With --force, existing copied paths are backed up before replacement.
- By default, the target must be a Git repository. Use --allow-non-git for bootstrap tests or new folders.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)
      FORCE="true"
      shift
      ;;
    --dry-run)
      DRY_RUN="true"
      shift
      ;;
    --check)
      CHECK_ONLY="true"
      shift
      ;;
    --allow-non-git)
      ALLOW_NON_GIT="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      if [[ -z "$TARGET" ]]; then
        TARGET="$1"
      else
        echo "Unexpected argument: $1" >&2
        usage
        exit 2
      fi
      shift
      ;;
  esac
done

if [[ -z "$TARGET" ]]; then
  usage
  exit 2
fi

mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"
timestamp="$(date -u '+%Y%m%dT%H%M%SZ')"

if [[ "$ALLOW_NON_GIT" != "true" && ! -d "$TARGET/.git" ]]; then
  echo "REFUSE: $TARGET is not a Git repository. Use --allow-non-git to override." >&2
  exit 1
fi

if [[ "$CHECK_ONLY" == "true" ]]; then
  if [[ ! -x "$TARGET/scripts/validate-agentic-env.sh" ]]; then
    echo "FAIL: $TARGET does not contain scripts/validate-agentic-env.sh" >&2
    exit 1
  fi
  (cd "$TARGET" && scripts/validate-agentic-env.sh)
  echo "Dev contract check complete in $TARGET"
  exit 0
fi

copy_path() {
  src="$1"
  dest="$2"
  if [[ -e "$dest" ]]; then
    if [[ "$FORCE" != "true" ]]; then
      echo "REFUSE: $dest already exists. Re-run with --force to back it up and replace it." >&2
      exit 1
    fi
    backup="$dest.backup-$timestamp"
    if [[ "$DRY_RUN" != "true" ]]; then
      mv "$dest" "$backup"
    fi
    echo "BACKUP: $dest -> $backup"
    backed_up=$((backed_up + 1))
  fi
  if [[ "$DRY_RUN" != "true" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp -R "$src" "$dest"
  fi
  echo "COPY: $src -> $dest"
  copied=$((copied + 1))
}

copy_path "$ROOT_DIR/.dev" "$TARGET/.dev"
copy_path "$ROOT_DIR/scripts" "$TARGET/scripts"
copy_path "$ROOT_DIR/adapters" "$TARGET/adapters"
copy_path "$ROOT_DIR/.github" "$TARGET/.github"

for file in README.md LICENSE NOTICE CHANGELOG.md CONTRIBUTING.md CODE_OF_CONDUCT.md SECURITY.md Makefile; do
  copy_path "$ROOT_DIR/$file" "$TARGET/$file"
done

if [[ "$DRY_RUN" == "true" ]]; then
  echo "Dry run complete for $TARGET"
  echo "Summary: would copy $copied paths; would back up $backed_up paths."
  exit 0
fi

if [[ -x "$TARGET/scripts/validate-agentic-env.sh" ]]; then
  (cd "$TARGET" && scripts/validate-agentic-env.sh)
fi

echo "Dev contract initialized in $TARGET"
echo "Summary: copied $copied paths; backed up $backed_up paths."
