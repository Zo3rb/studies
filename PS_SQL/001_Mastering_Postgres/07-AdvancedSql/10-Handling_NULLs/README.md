# Lesson 10: Handling NULLs

## Purpose

NULL represents missing/unknown information and uses three-valued logic. Use IS NULL, IS NOT DISTINCT FROM for null-safe equality, and COALESCE for a fallback. COUNT(column) ignores NULL while COUNT(*) counts rows. This lesson follows course video **0082. Handling nulls.mp4**.

## Core ideas

NULL means the value is absent or unknown; it is not equal to any value, including another NULL. Comparisons with NULL generally yield UNKNOWN, and WHERE retains only TRUE. IS NULL tests missing values; IS NOT DISTINCT FROM provides null-safe equality. COALESCE returns the first non-NULL argument.

## Important behavior and common mistakes

- NOT IN can behave unexpectedly if the compared set contains NULL; consider NOT EXISTS for anti-joins.
- COUNT(column) skips NULL values, while COUNT(*) counts rows, including rows with NULL columns.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
SELECT NULL = NULL AS unknown_comparison, NULL IS NULL AS null_test, NULL IS NOT DISTINCT FROM NULL AS null_safe_equal, coalesce(NULL::text, 'fallback') AS default_value;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0082. Handling nulls.mp4`
- Module overview: [../README.md](../README.md)
