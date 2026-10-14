# Lesson 13: Materialized Views

## Purpose

A materialized view stores query results physically. Reads can be faster, but data is stale until refreshed. REFRESH MATERIALIZED VIEW recomputes it; CONCURRENTLY requires a qualifying unique index and a populated view. This lesson follows course video **0085. Materialized views.mp4**.

## Core ideas

A materialized view stores the query result, so reads use stored rows rather than rerunning the defining query. Its contents can become stale as base tables change. REFRESH MATERIALIZED VIEW recomputes the contents. REFRESH ... CONCURRENTLY allows readers to continue, but requires a populated view and a qualifying unique index covering all rows.

## Important behavior and common mistakes

- Refresh cost and staleness are part of the design: choose when and how often to refresh.
- A materialized view is a database object, unlike the transaction-local practice example which creates, refreshes, and drops it in one transaction.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
BEGIN;
CREATE MATERIALIZED VIEW lesson_daily_sales_summary AS
SELECT day, sum(amount) AS total
FROM (VALUES (current_date, 10::numeric), (current_date, 15::numeric)) AS daily_sales(day, amount)
GROUP BY day;
SELECT * FROM lesson_daily_sales_summary;
REFRESH MATERIALIZED VIEW lesson_daily_sales_summary;
DROP MATERIALIZED VIEW lesson_daily_sales_summary;
COMMIT;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0085. Materialized views.mp4`
- Module overview: [../README.md](../README.md)
