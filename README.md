# Studies — Software Engineering to AI Platform Engineering

This repository is a practical learning journal and portfolio workspace. It contains
course notes, coding exercises, database practice, systems foundations, daily training
guides, and the implementation work for a long-term AI Platform / MLOps Engineer path.

The repository is intentionally incremental: a roadmap item is a target, while source
code, tests, documentation, and recorded results are the evidence that a topic was
actually completed.

## Direction

The learning path combines two related goals:

1. Build strong software engineering and backend foundations.
2. Progress toward AI Platform Engineering / MLOps while retaining a full-stack
   development track.

The intended progression is:

```text
Python and Linux
        ↓
Git, testing, data structures, and algorithms
        ↓
SQL and PostgreSQL
        ↓
Backend APIs and service design
        ↓
Docker, CI/CD, AWS, and Terraform
        ↓
Kubernetes and observability
        ↓
ML pipelines, MLflow, and model serving
        ↓
LLM, embeddings, RAG, and AI platform systems
        ↓
Portfolio hardening and interviews
```

## Repository map

| Path | Purpose |
| --- | --- |
| [`ai-ml-journey/`](./ai-ml-journey/) | The 12-month AI Platform Engineer + Full-Stack SWE execution plan. |
| [`ai-ml-journey/checklist.md`](./ai-ml-journey/checklist.md) | The main roadmap, constraints, milestones, portfolio projects, and weekly checkpoints. |
| [`ai-ml-journey/trainings/`](./ai-ml-journey/trainings/) | One detailed study file per day, including resources, stopping points, labs, quizzes, interview questions, manager tasks, and progress records. |
| [`projects/`](./projects/) | Hands-on projects and practical exercises. |
| [`projects/warmup-cli/`](./projects/warmup-cli/) | The first warmup project for the AI Platform roadmap. |
| [`projects/bandit/`](./projects/bandit/) | OverTheWire Bandit Linux and command-line exercises, with notes and evidence through level 12. |
| [`boot.dev/`](./boot.dev/) | A progressive Python and TypeScript backend curriculum with course notes and companion exercises. |
| [`PS_SQL/`](./PS_SQL/) | PostgreSQL courses, SQL scripts, database notes, and per-lesson practice. |
| [`DSA/`](./DSA/) | Data structures, algorithms, complexity analysis, problem-solving patterns, and implementations. |
| [`leetcode/`](./leetcode/) | LeetCode solutions and coding practice organized by difficulty. |
| [`python_projects_learning_roadmap.md`](./python_projects_learning_roadmap.md) | A Python-focused project roadmap supporting the backend and platform direction. |
| [`maths.md`](./maths.md) | Supporting mathematics notes. |
| [`books.md`](./books.md) | Reading list and study references. |
| [`skill-using.txt`](./skill-using.txt) | Notes about the repository's learning workflow and tooling. |

## AI Platform roadmap

The current roadmap is designed for an Ubuntu machine with 16GB RAM and no GPU,
using AWS Free Tier services and k3d for local Kubernetes practice. It prioritizes
small, reproducible, CPU-friendly systems instead of resource-heavy experiments.

### Planned portfolio projects

| Project | Main technologies | Target outcome |
| --- | --- | --- |
| Platform API Service | FastAPI, PostgreSQL, Redis, Docker, CI/CD | A tested, containerized backend service. |
| ML Pipeline and Model Serving | scikit-learn, MLflow, FastAPI, Prometheus | Tracked experiments and a monitored inference API. |
| RAG Knowledge Service | Qdrant, embeddings, a small LLM, FastAPI | A CPU-friendly retrieval-augmented generation service. |
| MERN + AI Integration | React, Node.js, MongoDB, RAG API | A full-stack AI application. |
| AI Platform Capstone | k3d, Terraform, CI/CD, Grafana, runbooks | An integrated platform deployment with operational evidence. |

Each portfolio project is expected to include a clear README story, architecture
diagram, tests, Dockerfile, runbook, and short demo script.

### Daily training workflow

Daily execution is recorded in [`ai-ml-journey/trainings/`](./ai-ml-journey/trainings/).
Each day should produce a tangible artifact where appropriate:

1. Recall and prerequisite check
2. Focused study using the listed resources only
3. Guided lab
4. Project implementation
5. Quiz and mock interview practice
6. Manager-style task
7. Review, commit, and progress record

The first available guide is
[Day 1 — Environment and Engineering Workflow](./ai-ml-journey/trainings/01-day-01-environment-and-workflow.md).

## Current progress

The repository currently provides the following evidence:

- The local warmup project contains a minimal runnable Python entry point and README.
- Day 1 of the AI Platform training sequence is documented and ready to execute.
- PostgreSQL introductory and advanced lesson material is present, including ongoing
  work in the Mastering PostgreSQL modules.
- Python and backend curriculum material is present under `boot.dev/`.
- DSA implementations, notes, patterns, and challenge solutions are available.
- LeetCode practice includes Easy and Medium solutions and continues to grow.
- Bandit command-line exercises include solution notes through level 12.

These statements describe repository contents, not claims that the complete roadmap or
all listed courses have been finished.

## Recommended starting order

For the current AI Platform journey:

1. Read the [AI/ML execution checklist](./ai-ml-journey/checklist.md).
2. Complete the daily guide in
   [`ai-ml-journey/trainings/`](./ai-ml-journey/trainings/), starting with Day 1.
3. Work on the corresponding artifact in [`projects/`](./projects/).
4. Keep Python, SQL, Git, Linux, Docker, and DSA practice alongside the roadmap.
5. Record what was built, what broke, what was fixed, and what comes next.

For foundational study, use the detailed guides in this order:

1. [Boot.dev backend curriculum](./boot.dev/README.md)
2. [PostgreSQL practice](./PS_SQL/)
3. [DSA study guide](./DSA/README.md)
4. [LeetCode practice](./leetcode/README.md)
5. [Bandit exercises](./projects/bandit/)

The AI Platform roadmap is the primary integrated path; the other areas reinforce its
programming, database, systems, and problem-solving requirements.

## Working conventions

- Work in small, reviewable increments.
- Use conventional commit prefixes such as `feat:`, `fix:`, `docs:`, `test:`,
  `chore:`, and `refactor:`.
- Commit the reason for a change, not only a description of the files changed.
- Never commit `.env` files, credentials, secrets, `node_modules`, `__pycache__`,
  virtual environments, or model weights.
- Keep project READMEs updated with the problem, architecture, trade-offs, failures,
  fixes, and next steps.
- Check a folder's source files and evidence before treating a planned module as
  complete.
- For database lessons, read the SQL header and connect to the named database before
  running a script.

Most folders are independent lessons or exercises. There is no root-level dependency
installation, application entry point, or single test command; use the instructions
inside the relevant project or lesson.
