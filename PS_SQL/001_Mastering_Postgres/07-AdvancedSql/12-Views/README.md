# Lesson 12: Views

## Purpose

A view stores a query definition, not its result. It provides a reusable interface and can simplify access control and query composition. Updatable views have restrictions; use INSTEAD OF triggers or rules for more complex writes. This lesson follows course video **0084. Views.mp4**.

## Core ideas

A regular view stores a query definition and runs that query when referenced; it does not store a snapshot of the rows. Views can provide a stable named interface over joins or calculations and can limit which columns are exposed. Simple views may be automatically updatable, subject to PostgreSQL’s rules.

## Important behavior and common mistakes

- Replacing a view must preserve compatible existing output columns and types.
- A view can simplify access but is not automatically a performance optimization or a security boundary; review ownership and privileges.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
CREATE OR REPLACE TEMP VIEW high_values AS SELECT * FROM (VALUES ('a',10),('b',30)) AS v(label, amount) WHERE amount >= 20; SELECT * FROM high_values; DROP VIEW high_values;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0084. Views.mp4`
- Module overview: [../README.md](../README.md)
