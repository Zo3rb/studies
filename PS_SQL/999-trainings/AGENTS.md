# AGENTS.md – Instructions for AI Agents

**Purpose**  
This file contains mandatory rules and context for any AI coding agent working on the `trainings-platform` project.  
It exists to eliminate hallucinations, maintain consistency, and enforce the documentation-first, phase-by-phase methodology.

**Target Agents**

- Antigravity 2.0
- GitHub Copilot (Chat, Workspace, Agent mode, Copilot Edits, etc.)
- Any other LLM-based coding assistant

---

## 1. Mandatory First Actions (Always Do This)

Before generating **any** code, suggestion, or answer:

1. Read the following files **in order**:
   - `README.md`
   - `AGENTS.md` (this file)
   - `docs/roadmap.md`
   - `docs/architecture.md`
   - `docs/database/README.md`
   - `docs/database/data-types.md`
   - `docs/database/schema.md` (once it has content)
   - `docs/README.md`

2. Confirm you have read the latest versions of the above files in your response.

3. Never assume anything that is not explicitly documented.

---

## 2. Core Project Rules (Never Violate)

- **Documentation First**  
  Every change, feature, or new file **must** be documented **before** any code is written or modified. Update the relevant `.md` file(s) first.

- **Phase-by-Phase Development**  
  Only work on the current active phase defined in `docs/roadmap.md`. Do not jump ahead. When a phase is completed, explicitly update the roadmap and mark the phase as done.

- **Prisma + Native SQL**
  - Prefer Prisma for standard CRUD operations.
  - Use native SQL (`.sql` files or Prisma `$queryRaw`) for complex queries, reporting, migrations, or performance-critical code.
  - Always show both approaches when relevant.

- **PostgreSQL (`trainings` database)**  
  Use the data types and patterns documented in `docs/database/data-types.md`.

- **Naming & Conventions**  
  Follow conventions defined in the current phase (to be finalized in Phase 1). Until then, use clear, descriptive names.

- **Open Source (MIT)**  
  All code and documentation must remain compatible with the MIT license.

---

## 3. Anti-Hallucination Rules

- Never invent schema, endpoints, file names, or libraries not present in the documentation.
- If something is unclear, **ask clarifying questions** instead of guessing.
- When suggesting code, always include the exact file path and reference the relevant documentation section.
- If a feature requires a new extension, library, or major decision, propose it in the appropriate `.md` file first.

---

## 4. How to Work on This Project

1. Start every session by reading the mandatory files listed above.
2. Check `docs/roadmap.md` to confirm the current phase.
3. Propose changes only within the current phase scope.
4. Always update documentation **before** showing code changes.
5. When editing code, also update any affected documentation files in the same response or PR.

---

## 5. Special Notes for Specific Agents

**GitHub Copilot**

- Use `/docs` references in prompts when possible.
- Prefer editing existing documented files over creating new ones without documentation.

**Antigravity 2.0**

- Treat this project as a single long-running context. Always re-read the mandatory files at the start of each new conversation or major task.

---

## 6. Current Project Status (Auto-Updated)

- **Root folder**: `999-trainings`
- **Project name**: `trainings-platform`
- **License**: MIT
- **Current Phase**: Phase 2 – Backend API (In progress / Planning)
- **Previous Phase**: Phase 1 – Database Foundation (Completed)
- **Current Phase Goal**: Finalize backend conventions and implementation decisions before scaffolding the API.

---

## 7. Environment & Secrets (New)

- Never suggest committing `.env`, `.env.local`, or any file containing real credentials.
- Always reference `.env.example` when environment variables are needed.
- Add new required variables to `.env.example` first, then update documentation.

**Last Updated**: August 2026  
**Maintained by**: Project Owner + AI Agents following this file

---

> **Reminder to all agents**: If you cannot follow the rules above, do not generate code. Ask for clarification instead.
