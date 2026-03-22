#!/usr/bin/env bash
# PostToolUse — matcher Skill: append a compact run record to daily JSONL logs.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

ensure_dirs

INPUT=$(read_stdin_json)
SKILL_NAME=$(echo "$INPUT" | jq -r '.tool_input.skill // "unknown"')

if is_meta_skill "$SKILL_NAME"; then
  exit 0
fi

LOG_FILE="$LOGS_DIR/skill-runs-$(timestamp_date).jsonl"
PREVIEW=$(echo "$INPUT" | jq -c '{tool_name, tool_input, tool_result: (.tool_result // .result // null)}' 2>/dev/null || echo "{}")

jq -n \
  --arg timestamp "$(timestamp_utc)" \
  --arg skill "$SKILL_NAME" \
  --argjson preview "$PREVIEW" \
  '{
    timestamp: $timestamp,
    event: "skill_run",
    skill: $skill,
    record: $preview
  }' >> "$LOG_FILE"

exit 0
