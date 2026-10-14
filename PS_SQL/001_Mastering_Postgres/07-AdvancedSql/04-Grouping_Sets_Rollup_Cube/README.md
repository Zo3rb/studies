# Lesson 04: Grouping Sets, ROLLUP, and CUBE

## Purpose

GROUPING SETS computes several grouping levels in one query. ROLLUP produces a hierarchy of subtotals; CUBE produces every combination. GROUPING() distinguishes subtotal NULLs from source NULL values. This lesson follows course video **0076. Grouping s rollups cubes.mp4**.

## Core ideas

GROUPING SETS is shorthand for several grouped queries combined into one result. ROLLUP(a,b,c) emits the detail grouping and successive rightmost rollups; CUBE(a,b,c) emits all 2^3 combinations. Omitted grouping columns appear as NULL in subtotal rows. GROUPING(...) returns a bit mask that distinguishes those subtotal markers from genuine NULL data.

## Important behavior and common mistakes

- ROLLUP column order controls which subtotals are produced.
- CUBE grows exponentially with the number of dimensions; use only the combinations the report needs.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
WITH sales(region, product, amount) AS (VALUES ('north','tea',10), ('north','coffee',20), ('south','tea',7)) SELECT region, product, sum(amount), grouping(region, product) AS subtotal_mask FROM sales GROUP BY ROLLUP(region, product) ORDER BY region NULLS LAST, product NULLS LAST;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0076. Grouping s rollups cubes.mp4`
- Module overview: [../README.md](../README.md)
