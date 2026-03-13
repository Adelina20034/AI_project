---
name: git-workflow
description: Standard git workflow for this repo (branches, conventional commits, PR expectations, approvals, squash merge). Use when starting work, preparing commits, or opening a PR to ensure consistency with AGENTS.md.
---

# Git Workflow (Repo Standard)

## 1. Branch Naming

- `feat/[description]` for features
- `fix/[description]` for bug fixes
- `chore/[description]` for maintenance

**Expected**: Branch name matches intent and is readable.

## 2. Conventional Commits

Use:
- `feat: ...`
- `fix: ...`
- `docs: ...`
- `chore: ...`

Guidelines:
- Keep commits small and reviewable.
- Prefer one logical change per commit when possible.

**Expected**: History is easy to review and bisect.

## 3. PR Expectations

Include:
- What changed + why
- How to test (commands from `PROJECT.md`)
- Risks/rollout notes (migrations, flags)

Before requesting review:
- Lint/typecheck/tests pass (per `PROJECT.md`)
- No secrets/PII committed or logged
- Acceptance criteria covered by tests

**Expected**: Reviewer can validate quickly and safely.

## 4. Merge

- CI must pass + human approval required
- Prefer squash merge to `main`

**Expected**: Main stays green and linear.

