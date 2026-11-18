# Studies — Software Engineering to AI/ML & AI Platform Engineering

A personal learning journal and portfolio workspace. It holds course notes, coding
exercises, database practice, systems foundations, and project work, and it is kept as
evidence of what has actually been built and understood.

The repository is intentionally incremental: a roadmap item is a target, while source
code, tests, notes, and recorded results are the proof that it was completed.

## Target roles

- **AI/ML Engineer**
- **AI Platform Engineer**
- **Forward Deployed Engineer**

The path starts with strong software-engineering and backend foundations, then layers on
data, machine learning, production platform work, and client-facing delivery.

```text
Linux and the terminal
        ↓
Python, Git, testing, SQL, and data structures
        ↓
Data analysis, statistics, and machine learning
        ↓
APIs, Docker, Kubernetes, CI/CD, and observability
        ↓
Production AI platforms and model serving
        ↓
Forward-deployed delivery, documentation, and storytelling
```

## Current focus — November 2026

| Track | What is active | Where |
| --- | --- | --- |
| **Platform foundation** | Linux Mastery course (DevOp Camp ZTM), study period Oct 30 – Nov 15, 2026 | [`Linux/`](./Linux/) |
| **Coursera roadmap v2** | Phase 1: Linux security/cloud and IBM containers & microservices | [Coursera Roadmap v2](<Coursera-Roadmap v2 (Project-Powered).md>) |
| **PostgreSQL** | Mastering PostgreSQL modules and per-lesson practice | [`PS_SQL/`](./PS_SQL/) |
| **DSA and interviews** | Data structures, patterns, and LeetCode practice | [`DSA/`](./DSA/), [`leetcode/`](./leetcode/) |
| **Python projects** | Terminal task tracker and gradebook | [`projects/`](./projects/) |

The active execution plan is the
[Coursera Roadmap v2](<Coursera-Roadmap v2 (Project-Powered).md>): a 37-week,
six-phase path running from **Nov 2, 2026 to Jul 18, 2027**. It schedules 21 remaining
courses and grows one flagship AI service project through each phase. Phase 1 runs
Nov 2 – Dec 6, 2026.

## Repository map

| Path | Purpose | State |
| --- | --- | --- |
| [`Linux/`](./Linux/) | Linux Mastery course notes, runnable `practice.sh` scripts, and quizzes. | Modules 01–02 present; the course runs through Module 20. |
| [`PS_SQL/`](./PS_SQL/) | PostgreSQL courses, lesson notes, and practice scripts. | Two courses, 12 lesson groups, 218 SQL scripts. |
| [`DSA/`](./DSA/) | Data structures, algorithms, complexity analysis, and problem-solving patterns in Python and JavaScript. | 12 documented topic areas, 59 Python and 59 JavaScript files. |
| [`leetcode/`](./leetcode/) | LeetCode solutions with problem notes, screenshots, and complexity discussion. | 42 problems: 40 Easy and 2 Medium, in Python, JavaScript, TypeScript, and SQL. |
| [`projects/task_tracker/`](./projects/task_tracker/) | Terminal task tracker with JSON persistence and input validation. | Runnable. |
| [`projects/student_grades/`](./projects/student_grades/) | Student and gradebook models with JSON storage. | Core classes implemented; the CLI entry point is still in progress. |
| [`projects/bandit/`](./projects/bandit/) | OverTheWire Bandit Linux and command-line exercises. | Levels 0–12 documented with passwords, solutions, and screenshots. |

There is no root-level dependency installation, application entry point, or single test
command. Each folder is self-contained; use the README or run instructions inside it.

## The Coursera path at a glance

| Phase | Dates | Focus | Flagship deliverable |
| --- | --- | --- | --- |
| 1. Platform foundation | Nov 2 – Dec 6, 2026 | Linux security, containers, microservices | Hardened Linux base and containerized microservices on Kubernetes |
| 2. Data foundations | Nov 30, 2026 – Feb 7, 2027 | Analytics, statistics, Python | Data analysis and stakeholder brief |
| 3. Machine learning | Feb 1 – Apr 4, 2027 | Supervised and advanced ML | Trained, evaluated model served as an API |
| 4. Data and algorithms core | Mar 29 – May 16, 2027 | SQL pipelines, algorithms | SQL-backed pipeline and algorithmic core |
| 5. Production engineering | May 17 – Jul 11, 2027 | Testing, CI/CD, IaC, security, observability | Production-grade AI platform |
| 6. Delivery and storytelling | Jul 5 – Jul 18, 2027 | Data storytelling | Forward-deployed delivery and handoff |

Each phase project is expected to leave a README story, architecture diagram,
tests, a Dockerfile where relevant, a runbook, and a short demo.

## How the study loop works

Each study session should produce a tangible artifact where appropriate:

1. Recall and prerequisite check
2. Focused study using the listed resource only
3. Guided lab or exercise
4. Project implementation
5. Quiz and mock-interview practice
6. Manager-style task
7. Review, commit, and progress record

A checked box is not evidence on its own. Before treating a module as complete, check
the folder's source files, notes, and recorded results.

## Running the practice work

**Linux lessons**

```bash
cd Linux/02-Setting_Up_the_Environment/01-Linux_Distributions
bash practice.sh
```

Read the module `README.md` first; it explains the objective, lesson list, and status.

**PostgreSQL lessons**

Read the header of each SQL script. Scripts are written for one of two databases:

- `dvdrental` — the sample database, used for read-only query practice
- `trainings` — the practice database, used for exercises and schema experiments

Connect to the named database before running a script.

**Python projects**

```bash
cd projects/task_tracker
python3 main.py
```

The project modules use directory-local imports, so run them from their own folder.

**DSA tests**

```bash
cd "DSA/Arrays/sorted_squared_array"
python3 -m unittest
```

The sorted-squares exercise is currently the only DSA folder with a committed test
suite.

## Progress and evidence

This section describes what is in the repository, not a claim that every course or
roadmap item has been finished.

- **Linux:** Modules 01–02 scaffolded with lesson notes, practice scripts, and quizzes.
- **PostgreSQL:** Introductory and advanced courses present, including indexing,
  advanced data types, query plans, advanced SQL, and result generation.
- **DSA:** Arrays, big-O, hash tables, linked lists, queues, recursion, sets, stacks,
  searching, sorting, patterns, and maths for DSA, in Python and JavaScript.
- **LeetCode:** 40 Easy and 2 Medium problems with write-ups and screenshots.
- **Python:** A runnable task tracker and an in-progress gradebook application.
- **Bandit:** Command-line exercises completed and documented through level 12.
- **AI/ML projects:** Planned through the Coursera phases; no flagship implementation
  is committed yet.

## Planning and reference material

- **Active plan:** [Coursera Roadmap v2](<Coursera-Roadmap v2 (Project-Powered).md>)
- **Alternative and earlier plans:** `AI_ML_CHUNTER.md`, `AI_ML_by_educative.md`,
  `AI_ML_free_roadmap.md`, `28_day_math_for_ml_ai_arabic_roadmap.md`
- **Reading list:** `books.md`
- **Study-coach prompts:** `skill-using.txt`

The earlier `boot.dev` Python and backend curriculum and the `ai-ml-journey` plan are
retired from the active path. Their commits remain in git history.

## Working conventions

- Work in small, reviewable increments.
- Use conventional commit prefixes such as `feat:`, `fix:`, `docs:`, `test:`,
  `chore:`, and `refactor:`.
- Commit the reason for a change, not only a description of the files changed.
- Never commit `.env` files, credentials, secrets, `node_modules`, `__pycache__`,
  virtual environments, or model weights.
- Keep project READMEs updated with the problem, architecture, trade-offs, failures,
  fixes, and next steps.
- For database lessons, read the SQL header and connect to the named database before
  running a script.
- Record what was built, what broke, what was fixed, and what comes next.

## Attribution

These notes summarize and practice material from external courses and platforms,
including Coursera, IBM, DevOp Camp ZTM, Boot.dev, PostgreSQL exercises,
GeeksforGeeks, and OverTheWire. Course names and trademarks belong to their respective
owners. Solutions and written notes here are personal work unless stated otherwise.
