#!/usr/bin/env python3
"""Pre-edit guardrail enforcement.

Reads JSON on stdin: {"file_path": str, "content": str}.
Loads mechanically checkable rules from guardrail-rules.json and blocks the edit on any "block" severity match.

Exit codes: 0 allow, 2 block (Claude Code PreToolUse convention).
"""
import fnmatch
import json
import re
import sys
from pathlib import Path

RULES_FILE = Path(__file__).resolve().parent / "guardrail-rules.json"


def load_rules(path):
    return json.loads(path.read_text(encoding="utf-8")).get("rules", [])


def main():
    try:
        payload = json.load(sys.stdin)
    except (json.JSONDecodeError, ValueError):
        return 0  # malformed input never blocks
    tool_input = payload.get("tool_input", payload)
    file_path = tool_input.get("file_path", "")
    content = tool_input.get("content") or tool_input.get("new_string") or ""
    if not content:
        return 0
    name = Path(file_path).name if file_path else ""
    blocked = []
    for rule in load_rules(RULES_FILE):
        globs = rule.get("applies_to", ["*"])
        if name and not any(fnmatch.fnmatch(name, g) for g in globs):
            continue
        if re.search(rule.get("pattern", ""), content, re.IGNORECASE):
            line = "[{}] {} ({})".format(rule["id"], rule.get("message", ""), rule.get("source", ""))
            if rule.get("severity") == "block":
                blocked.append(line)
            else:
                print("WARN " + line, file=sys.stderr)
    if blocked:
        print("Guardrail violation, edit blocked:", file=sys.stderr)
        for line in blocked:
            print("  " + line, file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
