# Lesson 17: COALESCE and Generated Columns

## Purpose

COALESCE returns the first non-NULL argument and all arguments must resolve to a compatible type. A generated column is computed from its row at write time; PostgreSQL generated columns are stored and their expressions must be immutable. This lesson follows course video **0089. COALESCE generated column.mp4**.

## Core ideas

COALESCE evaluates arguments from left to right and returns the first non-NULL value; arguments must resolve to a common type. A generated column derives its value from other columns in the same row. PostgreSQL stored generated expressions must be immutable, cannot use subqueries, and the generated value is maintained by PostgreSQL rather than directly assigned by an INSERT/UPDATE.

## Important behavior and common mistakes

- Choose a fallback value that has the intended meaning; replacing NULL with zero or an empty string can change semantics.
- Generated columns are appropriate for row-local deterministic derivations, not values that depend on other rows or current time.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
CREATE TEMP TABLE line_item(quantity int, unit_price numeric, total numeric GENERATED ALWAYS AS (quantity*unit_price) STORED); INSERT INTO line_item(quantity,unit_price) VALUES (2,4.50); SELECT quantity, unit_price, total, coalesce(NULL::text, 'no note') AS note FROM line_item; DROP TABLE line_item;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0089. COALESCE generated column.mp4`
- Module overview: [../README.md](../README.md)
