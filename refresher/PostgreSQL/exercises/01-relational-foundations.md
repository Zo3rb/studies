# PostgreSQL Session 1 — Relational Foundations

## Core vocabulary

- **Database:** an organized collection of data.
- **DBMS:** software that stores, protects, and queries data.
- **PostgreSQL:** an open-source relational DBMS.
- **Table:** a relation represented as rows and columns.
- **Row:** one record or instance.
- **Column:** one attribute with a defined type.
- **Primary key:** uniquely identifies a row.
- **Foreign key:** refers to a row in another table.
- **SQL:** the language used to define, query, and change relational data.

## SQL statement categories

### DDL — structure

```sql
CREATE TABLE ...
ALTER TABLE ...
DROP TABLE ...
```

### DML — changes

```sql
INSERT ...
UPDATE ...
DELETE ...
```

### DQL — reads

```sql
SELECT ...
```

### TCL — transactions

```sql
BEGIN;
COMMIT;
ROLLBACK;
```

## Example relationship

A customer can place many orders:

```text
customers (one) -------- (many) orders
```

The `orders.customer_id` foreign key points to
`customers.customer_id`. This avoids duplicating the customer record in every
order and lets PostgreSQL enforce the relationship.

## Filtering

```sql
SELECT customer_id, full_name
FROM public.customers
WHERE active = TRUE;
```

## Ordering and limiting

```sql
SELECT order_id, amount
FROM public.orders
ORDER BY amount DESC
LIMIT 3;
```

## Aggregation

```sql
SELECT
    customer_id,
    COUNT(*) AS order_count,
    SUM(amount) AS total_spent
FROM public.orders
GROUP BY customer_id;
```

## Joining

```sql
SELECT c.full_name, o.order_id, o.amount
FROM public.customers AS c
JOIN public.orders AS o
  ON o.customer_id = c.customer_id;
```

## Important details

- Use explicit columns instead of `SELECT *` in application code.
- Use table aliases when a query involves multiple tables.
- Put join relationships in an explicit `ON` condition.
- Use constraints to prevent invalid data.
- SQL uses three-valued logic around `NULL`; `NULL = NULL` is not true.
- Use `IS NULL` and `IS NOT NULL`.
- Test an `UPDATE` or `DELETE` condition with `SELECT` first.

## First study questions

Answer these before running the example:

1. Why should `orders.customer_id` be a foreign key?
2. What is the difference between `WHERE` and `HAVING`?
3. Why is `numeric(10, 2)` preferable to floating point for money?
4. What rows does a `LEFT JOIN` preserve when the right table has no match?
   These questions will be revisited as each topic is studied.
