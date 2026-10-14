# Lesson 08: Recursive CTEs

## Purpose

A recursive CTE has an anchor term and a recursive term joined with UNION or UNION ALL. Each iteration feeds newly produced rows back into the recursive term. Define a termination condition; use UNION when duplicate elimination is needed. This lesson follows course video **0080. Recursive CTE.mp4**.

## Core ideas

A recursive CTE combines an anchor query with a recursive query using UNION or UNION ALL. PostgreSQL repeatedly evaluates the recursive term using rows produced so far until an iteration returns no new rows. A numeric sequence is a simple example; graph traversal and hierarchy walks use the same pattern.

## Important behavior and common mistakes

- Ensure the recursive term progresses toward a stopping condition.
- UNION removes duplicates across iterations, while UNION ALL preserves them and can run indefinitely if the recursion cycles.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
WITH RECURSIVE seq(n) AS (SELECT 1 UNION ALL SELECT n + 1 FROM seq WHERE n < 10) SELECT n FROM seq ORDER BY n;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0080. Recursive CTE.mp4`
- Module overview: [../README.md](../README.md)
