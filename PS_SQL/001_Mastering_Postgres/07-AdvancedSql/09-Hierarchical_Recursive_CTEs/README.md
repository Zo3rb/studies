# Lesson 09: Hierarchical Recursive CTEs

## Purpose

Represent a hierarchy with an adjacency list (each row points to its parent). Start from root rows, recursively join children, and carry depth or a path for ordering and cycle awareness. This lesson follows course video **0081. Hierarchical recursive CTE.mp4**.

## Core ideas

An adjacency-list table stores a parent identifier on each child row. Start with root rows in the anchor, then join each iteration’s current rows to their children. Carrying a depth supports indentation/level limits; carrying an ID path supports ordering and explicit cycle detection. The example uses a small inline hierarchy so it runs without changing the sample database.

## Important behavior and common mistakes

- A hierarchy may have multiple roots, missing parents, or cycles; decide how each case should be handled.
- Use a stable path/order key when displaying a tree; recursive evaluation order itself is not a display-order guarantee.

## Syntax and examples

The focused runnable examples are in the practice files. The trainings script demonstrates the core pattern with compact data; the dvdrental script connects the idea to the course sample database.


## Example

```sql
WITH RECURSIVE tree(id, parent_id, label, depth, path) AS (SELECT id, parent_id, label, 0, ARRAY[id] FROM (VALUES (1,NULL::int,'root'), (2,1,'child A'), (3,1,'child B'), (4,2,'grandchild')) AS n(id,parent_id,label) WHERE parent_id IS NULL UNION ALL SELECT n.id,n.parent_id,n.label,t.depth+1,t.path||n.id FROM (VALUES (1,NULL::int,'root'), (2,1,'child A'), (3,1,'child B'), (4,2,'grandchild')) AS n(id,parent_id,label) JOIN tree AS t ON n.parent_id=t.id WHERE NOT n.id = ANY(t.path)) SELECT id, parent_id, label, depth, path FROM tree ORDER BY path;
```

## Check your understanding

- Identify the input rows, the operation applied, and why the output has its particular shape.
- Check what happens with ties, NULLs, duplicate values, empty inputs, and ordering where relevant.

## Practice

1. Run [`practice_trainings.sql`](./practice_trainings.sql) in `trainings`.
2. Run [`practice_dvdrental.sql`](./practice_dvdrental.sql) in `dvdrental`.
3. Predict the output before execution, then change an input or ordering key and explain what changes.

## References in this repository

- Course video: `0081. Hierarchical recursive CTE.mp4`
- Module overview: [../README.md](../README.md)
