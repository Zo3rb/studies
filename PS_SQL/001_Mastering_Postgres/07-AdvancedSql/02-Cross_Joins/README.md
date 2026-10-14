# Lesson 02: Cross Joins

## Purpose

CROSS JOIN returns the Cartesian product: each left row pairs with every right row. Useful for combinations and scaffolding; row count is left_count × right_count. This lesson follows course video **0074. Cross joins.mp4**.

## Core ideas

A CROSS JOIN has no match predicate. Every row from the left input is paired with every row from the right input. It is useful for building combinations such as every product/size pair or a complete calendar/category grid. If either side is empty, the result is empty.

## Important behavior and common mistakes

- Estimate the product of input row counts before running the query; a small mistake can create a very large result.
- When the intended relationship is conditional, use an explicit JOIN ... ON predicate instead.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
SELECT color, size FROM (VALUES ('red'), ('blue')) AS c(color) CROSS JOIN (VALUES ('S'), ('M'), ('L')) AS s(size) ORDER BY color, size;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0074. Cross joins.mp4`
- Module overview: [../README.md](../README.md)
