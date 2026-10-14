# Lesson 11: Row Value Syntax

## Purpose

Row constructors compare multiple fields as a unit. Row comparisons are lexicographic and NULL can make the result unknown. Row-valued IN and IS [NOT] DISTINCT FROM can simplify paired-key comparisons. This lesson follows course video **0083. Row value syntax.mp4**.

## Core ideas

A row constructor treats multiple expressions as one composite value. Equality compares corresponding fields; ordering comparisons are lexicographic, comparing left to right until a difference is found. Row-value IN can express a list of key pairs, and row comparisons can simplify keyset pagination over a composite ordering.

## Important behavior and common mistakes

- NULL fields can make row comparisons UNKNOWN; use IS [NOT] DISTINCT FROM when null-safe equality is required.
- For pagination, the row comparison columns and ORDER BY columns must form the same stable ordering.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
SELECT (2, 'b') > (2, 'a') AS lexicographic_order, (1,2) IS NOT DISTINCT FROM (1,2) AS row_equal;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0083. Row value syntax.mp4`
- Module overview: [../README.md](../README.md)
