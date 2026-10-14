# Lesson 07: CTEs with Window Functions

## Purpose

Combine a window calculation in a CTE with an outer filter. This pattern supports ranking, top-N-per-group, and filtering on window results, which are unavailable in WHERE at the same SELECT level. This lesson follows course video **0079. CTEs with window functions.mp4**.

## Core ideas

This pattern separates calculation from filtering: the inner stage assigns a window value, and the outer query filters it. It is a standard way to return the top N rows per group. ROW_NUMBER returns at most N rows per group; RANK or DENSE_RANK can retain more than N rows when values tie at the boundary.

## Important behavior and common mistakes

- Choose the ranking function to match the tie policy, and include a deterministic secondary sort where needed.
- The outer ORDER BY controls final display order; the window ORDER BY only controls the calculation.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
WITH ranked AS (SELECT department, employee, salary, row_number() OVER (PARTITION BY department ORDER BY salary DESC, employee) AS rn FROM (VALUES ('A','Lee',90), ('A','Kim',95), ('B','Jo',80)) AS e(department, employee, salary)) SELECT * FROM ranked WHERE rn <= 1 ORDER BY department;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0079. CTEs with window functions.mp4`
- Module overview: [../README.md](../README.md)
