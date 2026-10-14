# Lesson 06: Common Table Expressions (CTEs)

## Purpose

WITH names a query result for one statement and improves staged query composition. CTEs can be referenced by later CTEs and the main query. Materialization/planner behavior depends on PostgreSQL version and query form; do not assume a CTE is always an optimization fence. This lesson follows course video **0078. CTEs.mp4**.

## Core ideas

A common table expression names a query result for use later in the same statement. Multiple CTEs can be chained, making a complex query readable as stages. A CTE is scoped to one statement, not stored as a table. PostgreSQL may inline eligible CTEs; MATERIALIZED and NOT MATERIALIZED can influence planning when supported and appropriate.

## Important behavior and common mistakes

- A CTE does not guarantee faster execution; inspect the plan for performance questions.
- Keep each stage focused and give output columns clear names.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
WITH numbers AS (SELECT generate_series(1,5) AS n), doubled AS (SELECT n, n * 2 AS value FROM numbers) SELECT * FROM doubled WHERE value > 4 ORDER BY n;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0078. CTEs.mp4`
- Module overview: [../README.md](../README.md)
