#!/usr/bin/env bash
# PostToolUse — matcher Skill: heuristic quality score + append to skill eval/eval.json.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

ensure_dirs

THRESHOLD="${SKILL_EVAL_THRESHOLD:-80}"
INPUT=$(read_stdin_json)
SKILL_NAME=$(echo "$INPUT" | jq -r '.tool_input.skill // "unknown"')

if is_meta_skill "$SKILL_NAME"; then
  exit 0
fi

if [[ ! -d "$SKILLS_DIR/$SKILL_NAME" ]]; then
  exit 0
fi

# Heuristic: base score; penalize obvious error markers in serialized result.
RESULT_JSON=$(echo "$INPUT" | jq -c '.tool_result // .result // empty' 2>/dev/null || echo "null")
RESULT_STR=$(echo "$RESULT_JSON" | jq -r 'tostring' 2>/dev/null || echo "")
SCORE=$(printf '%s' "$RESULT_STR" | awk '
  {
    s = 85
    if (length($0) < 20) s -= 15
    if (tolower($0) ~ /error|exception|failed|undefined/) s -= 25
    if (s < 0) s = 0
    if (s > 100) s = 100
    print int(s)
  }
  END { if (NR == 0) print 70 }')

EVAL_DIR="$SKILLS_DIR/$SKILL_NAME/eval"
EVAL_FILE="$EVAL_DIR/eval.json"
mkdir -p "$EVAL_DIR"

if [[ ! -f "$EVAL_FILE" ]]; then
  echo '{"evaluations":[]}' > "$EVAL_FILE"
fi

TMP="$EVAL_FILE.tmp.$$"
jq \
  --argjson score "$SCORE" \
  --arg ts "$(timestamp_utc)" \
  '.evaluations += [{score: $score, timestamp: $ts, source: "post_hook"}]' \
  "$EVAL_FILE" > "$TMP"
mv "$TMP" "$EVAL_FILE"

WARN=""
if [[ "$SCORE" -lt "$THRESHOLD" ]]; then
  WARN="Skill output score ($SCORE) is below threshold ($THRESHOLD)."
fi

jq -n \
  --arg skill "$SKILL_NAME" \
  --argjson score "$SCORE" \
  --arg threshold "$THRESHOLD" \
  --arg warn "$WARN" \
  '{
    hookSpecificOutput: {
      skill_eval: {
        skill: $skill,
        score: $score,
        threshold: ($threshold | tonumber),
        below_threshold: ($score < ($threshold | tonumber)),
        note: (if $warn != "" then $warn else null end)
      }
    }
  }'

exit 0
