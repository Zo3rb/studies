# Lesson 4: Subqueries

## Purpose

This lesson explains how PostgreSQL builds result sets using **Subqueries**. It follows the topic sequence in the course video **0065. Subqueries.mp4**.

## Core concepts

- Scalar subqueries return one value
- IN/EXISTS express membership
- correlated subqueries refer to outer rows
- derived tables act as temporary relations
- ensure scalar cardinality

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

- Course video: `0065. Subqueries.mp4`
- Module overview: [../README.md](../README.md)
