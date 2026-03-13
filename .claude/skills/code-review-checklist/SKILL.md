---
name: code-review-checklist
description: Review rubric for PRs in this repo: scope, correctness, security/privacy, maintainability, tests coverage, and quality gates. Use when reviewing code or self-reviewing before requesting approval.
---

# Code Review Checklist

## 1. Intent and Scope

- Matches PRD/design doc scope.
- Non-goals respected.
- No unrelated refactors or drive-by changes.

**Expected**: PR is focused and aligned with requirements/design.

## 2. Correctness

- Implements acceptance criteria.
- Error handling is explicit; failures aren’t silently ignored.
- Edge cases handled (empty/invalid inputs, partial failures).

**Expected**: Behavior is correct across happy path + edge cases.

## 3. Security & Privacy

- No secrets/PII in logs or fixtures.
- Input validation at boundaries.
- Authn/authz checks are correct.
- No injection risks (unsafe interpolation in queries/commands).

**Expected**: No obvious security/privacy regressions.

## 4. Architecture & Maintainability

- Clear layering; responsibilities in the right place.
- Functions small; descriptive naming; minimal duplication.

**Expected**: Code is easy to evolve and reason about.

## 5. Tests

- Each acceptance criterion has at least one test.
- External services mocked.
- Tests deterministic and stable.

**Expected**: Tests protect the change and are CI-friendly.

## 6. Quality Gates

- Lint/typecheck/tests pass (use canonical commands from `PROJECT.md`).

**Expected**: Quality bars are met.

## 7. Docs and Rollout

- Docs updated for behavior/contract changes.
- Migrations/flags/rollout steps documented (if applicable).

**Expected**: Reviewers can deploy/operate safely.

## 8. Summary Report

Leave review notes grouped by category (with severity):
- Correctness
- Security
- Testing
- Maintainability
- Docs/Rollout

**Expected**: Notes are actionable and prioritized.

