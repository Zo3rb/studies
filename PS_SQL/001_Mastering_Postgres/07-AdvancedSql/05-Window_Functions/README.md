# Lesson 05: Window Functions

## Purpose

Window functions calculate across related rows without collapsing them. PARTITION BY defines groups; ORDER BY defines sequence; the frame controls which rows contribute. Use explicit frames for running aggregates. This lesson follows course video **0077. Window functions.mp4**.

## Core ideas

A window function runs over a “window” of rows related to the current row. PARTITION BY starts a separate window per group, ORDER BY defines sequence or peers, and the frame limits rows used by frame-sensitive aggregates. Unlike GROUP BY, a window function keeps each input row. ROW_NUMBER assigns a unique sequence, RANK leaves gaps after ties, and DENSE_RANK does not.

## Important behavior and common mistakes

- The default ordered frame includes peers; specify ROWS BETWEEN ... when a row-by-row running total is intended.
- Add a unique tie-breaker to ORDER BY when the result needs a deterministic row number or sequence.
- Window results cannot be filtered in WHERE at the same SELECT level; calculate in a CTE/subquery, then filter outside.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
WITH scores(name, points) AS (VALUES ('A',8), ('B',12), ('C',12)) SELECT name, points, rank() OVER (ORDER BY points DESC) AS place, sum(points) OVER (ORDER BY name ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total FROM scores ORDER BY name;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0077. Window functions.mp4`
- Module overview: [../README.md](../README.md)
