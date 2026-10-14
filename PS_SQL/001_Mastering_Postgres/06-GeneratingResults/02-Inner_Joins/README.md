# Lesson 2: Inner Joins

## Purpose

This lesson explains how PostgreSQL builds result sets using **Inner Joins**. It follows the topic sequence in the course video **0063. Inner Joins.mp4**.

## Core concepts

- A join combines rows by a predicate
- INNER JOIN retains only matches
- qualify ambiguous columns
- one-to-many joins multiply rows
- use PK/FK relationships

## Syntax and examples

The examples in this lesson's practice files use explicit table aliases, qualified join keys, and stable ordering where row order matters. Run the statements in the database named in each file header.

## Important behavior and common mistakes

- SQL results have no guaranteed order without an outermost `ORDER BY`.
- Join cardinality follows the data: a one-to-many relationship returns one output row for each matching pair.
- `NULL` is not an ordinary value. Use `IS NULL`/`IS NOT NULL`; be deliberate about predicates on the nullable side of an outer join.
- Parentheses and aliases make complex `FROM` expressions easier to reason about.
- A rewrite is correct only when it preserves duplicates, unmatched rows, and NULL behavior.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in the `trainings` database for self-contained examples where supplied.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in the `dvdrental` sample database.
3. Explain in your own words what each query returns, then change one predicate or join key and predict the result before executing it.

## References in this repository

- Course video: `0063. Inner Joins.mp4`
- Module overview: [../README.md](../README.md)
