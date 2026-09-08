# Parallel Study Plan: Python and PostgreSQL

This workspace contains two connected learning tracks:

- **Python** through [Python for Everybody (PY4E)](https://www.py4e.com/)
- **SQL/PostgreSQL** through [PostgreSQL for Everybody (PG4E)](https://www.pg4e.com/)

The goal is not only to finish lessons. It is to rebuild practical software
engineering fluency and create a foundation for data engineering and AI/ML
work.

## How we will study

Each study cycle follows the same pattern:

1. Study a short section from one course.
2. Attempt the exercises independently.
3. Share the question, code, query, output, or error.
4. Review the concept and the reasoning behind the solution.
5. Improve the solution using professional best practices.
6. Record the result in the relevant course folder.
7. Finish with a small variation or test.

We will avoid copying course material wholesale. The notes will contain
summaries, original explanations, examples, solutions to our own exercises,
and links back to the official lessons.

## Recommended parallel rhythm

For each topic:

- **Python session:** language concepts, program structure, data processing, or
  automation.
- **PostgreSQL session:** the related relational or SQL concept.
- **Integration session:** use Python to read, transform, and eventually write
  database data.

The Python and SQL tracks do not need to advance at exactly the same speed.
The important connection is to understand both sides of a data workflow:

```text
Python program
    |
    | SQL query / parameterized command
    v
PostgreSQL database
    |
    | rows returned
    v
Python objects and analysis
```

## Suggested progression

### Phase 1 — Core fluency

- Python variables, expressions, conditions, functions, loops, strings
- SQL `SELECT`, `WHERE`, `ORDER BY`, `INSERT`, `UPDATE`, `DELETE`
- PostgreSQL tables, rows, columns, and basic data types

### Phase 2 — Working with data

- Python files, lists, dictionaries, tuples, and exceptions
- SQL aggregates, `GROUP BY`, `HAVING`, and joins
- Primary keys, foreign keys, `NOT NULL`, `CHECK`, and `UNIQUE`

### Phase 3 — Practical applications

- Python modules, virtual environments, testing, regular expressions, and APIs
- PostgreSQL subqueries, common table expressions, views, and transactions
- Loading, cleaning, and validating data

### Phase 4 — Engineering depth

- Python objects, packaging, type hints, logging, and maintainable modules
- PostgreSQL indexes, query plans, constraints, concurrency, and migrations
- Python database access using parameterized queries

### Phase 5 — AI/ML foundation

- Python numerical and data tools
- SQL-backed datasets and reproducible feature extraction
- Exploratory analysis, statistics, scikit-learn, and eventually deep learning

## Working agreement

I will:

- explain the concept before presenting a solution;
- let you attempt exercises before revealing the answer;
- point out incorrect mental models precisely but constructively;
- distinguish “works for this example” from “is robust in production”;
- include edge cases, tests, and readable documentation;
- keep the pace appropriate for someone refreshing an existing degree-level
  foundation.

You will:

- attempt exercises before running to the answer when practical;
- include the exact error message when something fails;
- say whether you want a hint, explanation, review, or full solution;
- record useful conclusions in the course notes.

## Folder structure

```text
AGENT_GUIDELINES.md   # Governing guidelines for AI Agents / LLMs
STUDY_PLAN.md         # Overall study roadmap

Python/
  README.md
  notes/              # Lesson notes with 🧠 Maths & DSA Insights
  examples/           # Progressive exercise stubs & examples
  tests/              # Standard unittest test suites
  exercises/          # Problem sets & markdown tasks

PostgreSQL/
  README.md
  notes/              # SQL theory & optimization notes
  exercises/          # DDL/DML exercises & queries
```

The root `README.md` and `examples/session_01.py` contain the first Python
session created before this two-course structure was introduced.

## Session note template

Each substantial session should record:

```markdown
# Topic

## Source lesson

## Concepts

## Example

## Exercise

## Attempt and review

## Best practices

## Tests or verification

## Next step
```
