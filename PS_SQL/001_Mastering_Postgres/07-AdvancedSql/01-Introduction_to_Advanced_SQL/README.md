# Lesson 01: Introduction to Advanced SQL

## Purpose

Frame the section: advanced query composition, analytical operations, reusable query interfaces, and safe data changes. Review how these build on SELECT, joins, and aggregates. This lesson follows course video **0073. Introduction to advanced SQL.mp4**.

## Core ideas

Advanced SQL adds expressive query structures to the SELECT, join, and aggregate patterns already covered. The section moves from combinations and summaries to window calculations, reusable and recursive query blocks, views, and safer write patterns. Choose a feature based on the result you need: grouping reduces rows, windows retain rows, CTEs name query stages, and views expose reusable definitions.

## Important behavior and common mistakes

- Keep the result shape in mind: does the operation preserve detail rows or collapse them?
- Check deterministic ordering explicitly whenever a “first”, “latest”, or top-N result matters.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
SELECT current_date AS today, version() AS postgres_version;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0073. Introduction to advanced SQL.mp4`
- Module overview: [../README.md](../README.md)
