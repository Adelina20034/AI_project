---
name: implementation-workflow
description: Implement an approved design in small, mergeable phases with guardrails (security, structure, validations) and continuous checks using PROJECT.md commands. Use when coding a feature/fix and preparing review-ready changes.
---

# Implementation Workflow

## Inputs

- Design doc in `docs/architecture/`
- Repo rules in `AGENTS.md` and commands in `PROJECT.md`

## 1. Phase Plan

Break work into phases. For each phase define:
- Files to change/create
- Behavior change
- Validation to run (lint/typecheck/tests/build from `PROJECT.md`)

**Expected**: Each phase is mergeable and independently verifiable.

## 2. Branch and Commit Hygiene

- Create `feat/[feature-name]` or `fix/[bug-name]`.
- Use conventional commits (`feat:`, `fix:`, `docs:`, `chore:`).

**Expected**: Small, reviewable commits with clear intent.

## 3. Implement with Guardrails

- Keep functions short; single responsibility.
- Respect directory structure from `PROJECT.md`.
- Validate inputs at system boundaries.
- Never log tokens/passwords/PII.

**Expected**: Code matches repo conventions and security rules.

## 4. Validate Each Phase

- Run canonical lint/typecheck/tests/build from `PROJECT.md`.
- Fix failures immediately before proceeding.

**Expected**: All checks pass after each phase.

## 5. Keep Docs in Sync

- If you change contracts/behavior, update PRD/design/docs accordingly.

**Expected**: Docs reflect reality.

## 6. Summary Report

After implementing, provide:

### Passed Checks

- [ ] Design followed (or updated)
- [ ] Lint/typecheck/tests/build pass (`PROJECT.md`)
- [ ] No secrets/PII in logs or fixtures
- [ ] Docs updated if needed

### Failed Checks

For each failure:
1. **Category**: ...
   - Expected: ...
   - Actual: ...
   - Suggested fix: ...

### Overall Health

**[PASS / FAIL]** — brief explanation.

