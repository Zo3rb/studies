# Lesson 14: Removing Duplicate Rows

## Purpose

Find duplicates by grouping on the intended business key and HAVING count(*) > 1. For cleanup, rank rows with row_number() and delete rows after the survivor. Always use a stable unique key and inspect the target set before deleting. This lesson follows course video **0086. Removing duplicate rows.mp4**.

## Core ideas

“Duplicate” depends on the business key, not necessarily every column. First group by the intended key and inspect groups with COUNT(*) > 1. To keep one row, rank rows within each duplicate group using ROW_NUMBER and a stable preference rule, then target rows with a rank greater than one.

## Important behavior and common mistakes

- Preview the exact deletion target before changing production data; perform cleanup in a transaction with a unique key.
- Prevent recurrence with an appropriate UNIQUE constraint or index after cleaning existing duplicates.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
CREATE TEMP TABLE contacts(id int PRIMARY KEY, email text, created_at date); INSERT INTO contacts VALUES (1,'a@example.com','2024-01-01'),(2,'a@example.com','2024-02-01'),(3,'b@example.com','2024-01-01'); WITH ranked AS (SELECT id, row_number() OVER (PARTITION BY email ORDER BY created_at,id) AS rn FROM contacts) DELETE FROM contacts AS c USING ranked AS r WHERE c.id=r.id AND r.rn>1; SELECT * FROM contacts ORDER BY id; DROP TABLE contacts;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0086. Removing duplicate rows.mp4`
- Module overview: [../README.md](../README.md)
