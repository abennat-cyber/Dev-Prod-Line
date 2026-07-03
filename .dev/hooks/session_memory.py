#!/usr/bin/env python3
"""Session-end memory and telemetry capture.

Reads JSON on stdin: {"summary": str, "decisions": [str], "lessons": [str],
"usage": {...}} (all optional). Appends:
- a session entry to .dev/build/log.md
- decisions to .dev/build/decisions.md
- lessons to .dev/knowledge/lessons.md
- one JSONL record to .dev/telemetry/ledger.jsonl

Never blocks: all failures exit 0.
"""
import datetime
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def append(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a", encoding="utf-8") as handle:
        handle.write(text)


def main():
    try:
        payload = json.load(sys.stdin)
    except (json.JSONDecodeError, ValueError):
        payload = {}
    now = datetime.datetime.now(datetime.timezone.utc).isoformat(timespec="seconds")
    summary = payload.get("summary", "UNKNOWN")
    decisions = payload.get("decisions", [])
    lessons = payload.get("lessons", [])

    append(ROOT / ".dev/build/log.md", "\n## Session {}\n\n{}\n".format(now, summary))
    for item in decisions:
        append(ROOT / ".dev/build/decisions.md", "\n- {} ({})".format(item, now))
    for item in lessons:
        append(ROOT / ".dev/knowledge/lessons.md", "\n- {} ({})".format(item, now))

    record = {
        "ts": now,
        "event": "session_end",
        "decisions": len(decisions),
        "lessons": len(lessons),
        "usage": payload.get("usage", {}),
    }
    append(ROOT / ".dev/telemetry/ledger.jsonl", json.dumps(record) + "\n")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception:  # capture must never break a session
        sys.exit(0)
