# Lesson 03: Grouping

## Purpose

GROUP BY partitions input rows by grouping keys; aggregate functions calculate one result per group. HAVING filters groups after aggregation, whereas WHERE filters input rows. This lesson follows course video **0075. Grouping.mp4**.

## Core ideas

GROUP BY forms one output group for each distinct combination of grouping values. Aggregate functions summarize each group; the output no longer contains one row per source row. WHERE filters source rows before grouping, and HAVING filters groups after aggregates are computed. COUNT(*) counts rows; COUNT(expression) counts only non-NULL values.

## Important behavior and common mistakes

- Every selected expression must be grouped or aggregated (unless functionally dependent under PostgreSQL rules).
- Do not rely on output order from GROUP BY; add ORDER BY for a stable presentation.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
WITH sales(region, amount) AS (VALUES ('north',10), ('north',15), ('south',8)) SELECT region, count(*) AS orders, sum(amount) AS revenue FROM sales GROUP BY region HAVING sum(amount) > 10 ORDER BY region;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0075. Grouping.mp4`
- Module overview: [../README.md](../README.md)
