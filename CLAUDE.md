# CLAUDE

This repository defines an agentic development environment for software projects.  
It is intended to be used with an AI coding assistant that can act as multiple specialized sub-agents.

The goal is to give the assistant enough context and structure to behave like a small product development team, rather than a single monolithic assistant.

---

## Purpose

- Provide a reusable template for agentic software development.
- Define clear roles (product, architecture, implementation, testing, review).
- Standardize how PRDs, architecture docs, and code changes are created and updated.
- Make it easy to plug this setup into different tech stacks and projects.

This repository is **stack-agnostic**: concrete technologies are defined in `PROJECT.md` and in project-specific PRDs.

---

## How to Use This Template

1. **Configure the project context**
   - Fill in `PROJECT.md` with the tech stack, commands, directory structure, and standards for your specific project.
2. **Define your agents**
   - Customize `.claude/agents/*.md` to match your preferred roles and tools.
3. **Define your workflows**
   - Customize `.claude/commands/*.md` to represent common workflows (new feature, bugfix, refactor, etc.).
4. **Create PRDs and architecture docs**
   - Use the templates in `docs/templates/` to create real PRDs and architecture documents in `docs/prds/` and `docs/architecture/`.

---

## Roles & Responsibilities

The agent team typically includes (but is not limited to):

- **Product Manager** – clarifies requirements, writes and updates PRDs.
- **Architect** – designs technical solutions, updates architecture docs.
- **Implementer** – writes and modifies code according to the plan.
- **Tester** – creates and runs tests, ensures quality.
- **Code Reviewer** – reviews changes, suggests improvements.
- **Debugger** – investigates and fixes issues and regressions.

Exact agent configurations are defined in `.claude/agents/`.

---

## Documents

Key documents in this repository:

- `PROJECT.md` – technical context, stack, commands, conventions.
- `AGENTS.md` – high-level description of agent roles and collaboration rules.
- `AGENTIC-TEAM-GUIDE.md` – detailed guide on how to work with this agentic setup.
- `docs/templates/PRD-TEMPLATE.md` – template for Product Requirements Documents.
- `docs/templates/ARCHITECTURE-TEMPLATE.md` – template for architecture docs.

Project-specific documents should live under:

- `docs/prds/` – concrete PRDs for features or projects.
- `docs/architecture/` – concrete architecture diagrams and specs.

---

## Principles for AI Agents

When operating in this repository:

- Always read `PROJECT.md` before making non-trivial changes.
- Prefer updating PRDs and architecture docs instead of leaving important decisions only in code comments.
- Ask clarifying questions when requirements are ambiguous.
- Propose small, incremental changes rather than large rewrites, unless explicitly requested.
- Keep humans in the loop for destructive or high-impact actions.

---

## Adapting to a Specific Project

To adapt this template:

1. Clone or copy this repository into your project.
2. Update `PROJECT.md` with your actual tech stack and commands.
3. Adjust agent definitions in `.claude/agents/` to fit your tools and workflow.
4. Create initial PRDs and architecture docs for your core features.

Once configured, you can use your AI coding assistant with this repository as a "control center" for agentic development.
