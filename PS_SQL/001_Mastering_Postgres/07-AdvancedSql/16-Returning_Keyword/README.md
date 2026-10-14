# Lesson 16: RETURNING Keyword

## Purpose

RETURNING outputs values affected by INSERT, UPDATE, or DELETE without a follow-up SELECT. It can return generated keys and computed values; RETURNING * reflects the row after the change for INSERT/UPDATE and deleted row for DELETE. This lesson follows course video **0088. Returning keyword.mp4**.

## Core ideas

INSERT, UPDATE, and DELETE can return rows they affect using RETURNING. This avoids a second query to retrieve a generated key or the updated values. RETURNING can also appear inside a data-modifying CTE, allowing one write’s output to feed another operation in a single statement.

## Important behavior and common mistakes

- An UPDATE or DELETE with no matching rows returns no rows.
- Only use RETURNING data from rows the statement actually changed; it does not report rows skipped by ON CONFLICT DO NOTHING.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
CREATE TEMP TABLE notes(id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, body text); INSERT INTO notes(body) VALUES ('first'), ('second') RETURNING id, body; UPDATE notes SET body=upper(body) WHERE id=1 RETURNING id, body; DELETE FROM notes WHERE id=2 RETURNING id, body; DROP TABLE notes;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0088. Returning keyword.mp4`
- Module overview: [../README.md](../README.md)
