#!/usr/bin/env bash
# Skill eval metrics stored under each skill: <skill>/eval/eval.json
#
# Schema:
# {
#   "evaluations": [
#     { "score": 85, "timestamp": "...", "source": "post_hook" }
#   ]
# }

skill_has_eval() {
  local skill="$1"
  [[ -f "$SKILLS_DIR/$skill/eval/eval.json" ]]
}

get_latest_score() {
  local skill="$1"
  local f="$SKILLS_DIR/$skill/eval/eval.json"
  jq -r '.evaluations[-1].score // "N/A"' "$f" 2>/dev/null || echo "N/A"
}

get_best_score() {
  local skill="$1"
  local f="$SKILLS_DIR/$skill/eval/eval.json"
  jq -r 'if (.evaluations | length) > 0 then ([.evaluations[].score] | max) else "N/A" end' "$f" 2>/dev/null || echo "N/A"
}

get_eval_count() {
  local skill="$1"
  local f="$SKILLS_DIR/$skill/eval/eval.json"
  jq -r '.evaluations | length' "$f" 2>/dev/null || echo "0"
}

get_trend_direction() {
  local skill="$1"
  local f="$SKILLS_DIR/$skill/eval/eval.json"
  jq -r '
    .evaluations as $e |
    if ($e | length) < 4 then "stable"
    else
      ($e[-2:] | map(.score) | add / length) as $recent_avg |
      ($e[-4:-2] | map(.score) | add / length) as $older_avg |
      ($recent_avg - $older_avg) as $delta |
      if $delta > 2 then "up"
      elif $delta < -2 then "down"
      else "stable" end
    end
  ' "$f" 2>/dev/null || echo "stable"
}
