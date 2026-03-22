#!/usr/bin/env bash
# Stop: summarize today hook logs into a session report file.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

ensure_dirs

DAY=$(timestamp_date)
REPORT="$LOGS_DIR/session-report-$DAY.txt"
{
  echo "Session skill hooks summary ($DAY)"
  echo "Project: $CLAUDE_PROJECT_DIR"
  echo "Generated: $(timestamp_utc)"
  echo ""
  echo "=== pre-checks ($DAY) ==="
  if [[ -f "$LOGS_DIR/pre-checks-$DAY.jsonl" ]]; then
    wc -l <"$LOGS_DIR/pre-checks-$DAY.jsonl" | awk '{print "lines:", $1}'
    tail -n 5 "$LOGS_DIR/pre-checks-$DAY.jsonl" 2>/dev/null || true
  else
    echo "(no pre-checks log)"
  fi
  echo ""
  echo "=== skill runs ($DAY) ==="
  if [[ -f "$LOGS_DIR/skill-runs-$DAY.jsonl" ]]; then
    wc -l <"$LOGS_DIR/skill-runs-$DAY.jsonl" | awk '{print "lines:", $1}'
    tail -n 5 "$LOGS_DIR/skill-runs-$DAY.jsonl" 2>/dev/null || true
  else
    echo "(no skill-runs log)"
  fi
} >"$REPORT"

# Optional: pass path back for agents that read hook output
jq -n \
  --arg path "$REPORT" \
  --arg day "$DAY" \
  '{hookSpecificOutput: {session_report: {path: $path, day: $day}}}'

exit 0
