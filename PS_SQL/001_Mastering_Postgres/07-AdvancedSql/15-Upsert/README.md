# Lesson 15: Upsert

## Purpose

INSERT ... ON CONFLICT handles a uniqueness conflict atomically. DO NOTHING skips the conflicting row; DO UPDATE changes the existing row. The conflict target must match a usable unique constraint/index. EXCLUDED refers to the proposed row. This lesson follows course video **0087. Upsert.mp4**.

## Core ideas

INSERT ... ON CONFLICT combines insertion with a response to a unique constraint or unique index conflict. DO NOTHING skips the proposed row; DO UPDATE changes the conflicting row. In the update clause, EXCLUDED refers to the proposed insert values. PostgreSQL coordinates the conflict handling atomically, making this safer than a separate “check then insert” sequence.

## Important behavior and common mistakes

- The conflict target must identify a usable uniqueness rule; exclusion constraints cannot be arbiters for ON CONFLICT.
- Avoid assigning every incoming value blindly: decide whether the existing or proposed value should win for each column.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
CREATE TEMP TABLE inventory_item(sku text PRIMARY KEY, quantity int NOT NULL); INSERT INTO inventory_item VALUES ('A1',5); INSERT INTO inventory_item VALUES ('A1',3) ON CONFLICT (sku) DO UPDATE SET quantity=inventory_item.quantity+EXCLUDED.quantity; SELECT * FROM inventory_item; DROP TABLE inventory_item;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0087. Upsert.mp4`
- Module overview: [../README.md](../README.md)
