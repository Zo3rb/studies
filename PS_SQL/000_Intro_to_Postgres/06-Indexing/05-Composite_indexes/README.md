# Lesson 05: Composite Indexes

## 📖 Overview
A **Composite Index** (Multi-column Index) is built on two or more columns of a table. When written correctly, a single composite index can satisfy complex `WHERE`, `JOIN`, and `ORDER BY` clauses simultaneously.

---

## 🧠 Key Concepts & Column Ordering Rules

### 1. Left-Prefix Matching Rule
PostgreSQL can use a composite index `(col1, col2, col3)` for queries filtering on:
- `col1`
- `col1, col2`
- `col1, col2, col3`

> [!WARNING]
> A query filtering **only** on `col2` or `col3` **cannot** use the composite index `(col1, col2, col3)` effectively! The leading column (`col1`) must be present in the query predicate.

### 2. Ordering Rule (Equality First, Ranges Second)
When designing a composite index for queries with multiple filter conditions:
1. Place **Equality (`=`)** columns **first**.
2. Place **Range (`>`, `<`, `BETWEEN`, `LIKE`)** or **Sorting (`ORDER BY`)** columns **last**.

```
Optimal Index: (tenant_id, status, created_at)
                  │          │          │
              Equality   Equality     Range / ORDER BY
```

### 3. Index-Only Scans (`INCLUDE` Clause)
If all columns requested by a `SELECT` statement are present inside the index, PostgreSQL can return data directly from the index without reading the heap table pages (**Index-Only Scan**)!

```sql
CREATE INDEX idx_orders_covering ON orders (customer_id) INCLUDE (total_amount);
```

---

## 💻 SQL Code Examples

```sql
-- Creating a composite index following Equality-first rule
CREATE INDEX idx_rentals_cust_date ON rental (customer_id, rental_date);

-- Query that utilizes both columns of the composite index efficiently
EXPLAIN ANALYZE
SELECT rental_id, customer_id, rental_date
FROM rental
WHERE customer_id = 150 AND rental_date >= '2005-06-01';
```

---

## 🏆 Best Practices

- **Put Equality First**: `(status, created_at)` is superior to `(created_at, status)` if `status` is filtered with `=`.
- **Avoid Duplicate Indexes**: If you have a composite index `(a, b)`, you rarely need a single-column index on `(a)`.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Test left-prefix matching rules and Index-Only Scans with covering indexes.
- **`practice_dvdrental.sql`**: Build composite indexes on `rental` (`customer_id`, `rental_date`) and analyze plan changes.
