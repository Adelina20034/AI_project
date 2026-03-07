# PROJECT

This document defines the technical context, conventions, and constraints for this codebase.  
AI agents and human contributors should treat this as the single source of truth for how the project is structured and how work should be done.

---

## Tech Stack

- Backend: <Backend framework here> (e.g. Node.js with Express or NestJS)
- Frontend: <Frontend framework here> (e.g. React with Vite or Next.js)
- Database: <Primary database here> (e.g. PostgreSQL)
- Infra: <Infra & CI tools here> (e.g. Docker + docker-compose, GitHub Actions)

> When this template is applied to a specific project, fill in the concrete technologies and versions here.

---

## Commands

These are the canonical commands for building, running, testing, and checking this project.  
AI agents should prefer these over inventing new ones.

### Development

- Start backend dev server: `<backend dev command here>`
- Start frontend dev server: `<frontend dev command here>`
- Run all services locally (if applicable): `<orchestration/dev command here>`

### Testing

- Backend unit tests: `<backend test command here>`
- Frontend unit tests: `<frontend test command here>`
- Integration tests: `<integration/e2e test command here>`

### Quality

- Lint: `<lint command here>`
- Format: `<format command here>`
- Typecheck: `<typecheck command here>`

### Database

- Run migrations: `<migration up command here>`
- Rollback migrations: `<migration down command here>`
- Seed data: `<seed command here>`

> For a concrete project, replace these placeholders with real commands (e.g. `cd backend && npm run test`).

---

## Directory Structure

This is the expected high-level structure of the codebase.  
Agents should respect this layout when creating or moving files.

```text
.
├── backend/              # Backend application code
│   ├── src/              # Main backend source
│   └── tests/            # Backend tests
├── frontend/             # Frontend application code (if applicable)
│   └── src/              # Main frontend source
├── infra/                # Infrastructure-as-code, deployment, CI/CD scripts
└── docs/                 # Product and architecture documentation
