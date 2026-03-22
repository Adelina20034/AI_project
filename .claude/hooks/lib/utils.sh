#!/usr/bin/env bash
# Shared paths and helpers for Claude Code hooks (sourced from hook scripts).

set -euo pipefail

HOOKS_LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$(cd "$HOOKS_LIB_DIR/.." && pwd)"
_PROJECT_ROOT="$(cd "$HOOKS_DIR/../.." && pwd)"
export CLAUDE_PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$_PROJECT_ROOT}"

SKILLS_DIR="$CLAUDE_PROJECT_DIR/.claude/skills"
LOGS_DIR="$CLAUDE_PROJECT_DIR/.claude/logs"

ensure_dirs() {
  mkdir -p "$LOGS_DIR"
}

read_stdin_json() {
  cat
}

timestamp_utc() {
  date -u +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date -u +"%Y-%m-%dT%H:%M:%S" 2>/dev/null
}

timestamp_date() {
  date -u +"%Y-%m-%d" 2>/dev/null || date +"%Y-%m-%d"
}

# Returns 0 if this skill should skip health / eval hooks (meta / unknown).
is_meta_skill() {
  local name="$1"
  [[ "$name" == unknown ]] && return 0
  [[ "$name" == _* ]] && return 0
  [[ "$name" == meta ]] && return 0
  [[ $name == meta-* ]] && return 0
  return 1
}
