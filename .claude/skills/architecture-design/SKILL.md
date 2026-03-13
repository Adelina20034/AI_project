---
name: architecture-design
description: Create a technical design doc from an approved PRD: options/tradeoffs, chosen approach, data/API changes, security/error handling, phased rollout, and testing plan. Use after PRD approval and before implementation.
---

# Architecture / Technical Design

## Inputs

- Approved PRD: `docs/prds/PRD-[feature-name].md`
- Repo conventions: `AGENTS.md`, `PROJECT.md`

## 1. Scope and Constraints

- Restate goals/non-goals from PRD
- List hard constraints: security, privacy, performance, compatibility

**Expected**: Constraints are explicit and testable where possible.

## 2. Options and Trade-offs

- Option A / B (and C if needed)
- Trade-offs: complexity, risk, time, maintainability
- Chosen approach + rationale

**Expected**: A clear chosen approach with reasoning.

## 3. System Changes

- **Data model**: entities, schema changes, migrations
- **APIs**: endpoints/contracts, status codes, error format
- **Frontend** (if applicable): routes, state, key components
- **Jobs/events** (if applicable): retries, idempotency

**Expected**: Concrete changes that an implementer can execute.

## 4. Security and Error Handling

- Authn/authz checks and permission model
- Input validation boundaries
- Logging/telemetry guidelines (never log secrets/PII)

**Expected**: Security posture is explicit; failure modes are defined.

## 5. Rollout Plan

- Phases that can land independently
- Backward compatibility / migration strategy
- Validation commands: use canonical commands from `PROJECT.md` (fill placeholders first)

**Expected**: Low-risk rollout with clear validations.

## 6. Testing Plan

- Map PRD acceptance criteria → tests (unit/integration/e2e)
- Identify what to mock (external services) and fixtures/factories

**Expected**: Every acceptance criterion is mapped to tests.

## 7. Save Design Doc

- Save to `docs/architecture/[feature-name].md`

## 8. Summary Report

After writing the doc, provide:

### Completed

- [ ] Scope/constraints captured
- [ ] Options evaluated; approach chosen
- [ ] System changes defined
- [ ] Security/error handling defined
- [ ] Rollout plan defined
- [ ] Testing plan mapped to acceptance criteria

### Risks

For each risk:
1. **Risk**: ...
   - Impact: ...
   - Likelihood: ...
   - Mitigation: ...

