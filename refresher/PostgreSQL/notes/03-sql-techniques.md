# 📚 03-sql-techniques.md

## 🎯 Learning Objectives

- Master advanced SELECT techniques: **JOINs**, **UNION/INTERSECT**, **subqueries**, **CTEs**.
- Use **window functions** for ranking, running totals, and analytical queries.
- Apply **set operators** to combine result sets.
- Understand **performance considerations** (`EXPLAIN`, indexing hints) for complex queries.

## 📖 Theory

The third week of PG4E introduces _SQL Techniques_ that go beyond single‑table CRUD. These techniques let you:

1. **Combine rows from multiple tables** using various JOIN types (INNER, LEFT, RIGHT, FULL, CROSS).
2. **Nest queries** – subqueries in SELECT, FROM, WHERE, and HAVING clauses.
3. **Write reusable query blocks** with **Common Table Expressions** (`WITH`).
4. **Perform set operations** (`UNION`, `INTERSECT`, `EXCEPT`).
5. **Analyse rows** with **window functions** (`ROW_NUMBER()`, `RANK()`, `SUM() OVER (…)`).

### Why use CTEs?

- Improves readability by giving a name to a sub‑query.
- Allows recursive queries (not covered here).
- Can be referenced multiple times within the same statement.

### Join Basics

| Join      | Description                                                                                  |
| --------- | -------------------------------------------------------------------------------------------- |
| **INNER** | Returns rows with matching keys in both tables.                                              |
| **LEFT**  | Returns all rows from the left table, and matching rows from the right (NULL when no match). |
| **RIGHT** | Symmetric to LEFT.                                                                           |
| **FULL**  | Returns rows when there is a match in either table.                                          |
| **CROSS** | Cartesian product – every row of left with every row of right.                               |

### Window Functions

Window functions compute values **over a set of rows** that are related to the current row without collapsing the result set. Syntax:

```sql
SELECT column,
       window_func() OVER (PARTITION BY col1 ORDER BY col2 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS alias
FROM table;
```

Common ones: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `SUM() OVER (…)`, `AVG() OVER (…)`.

## 🛠️ Example (`examples/03-sql-techniques.sql`)

```sql
-- 1️⃣ Join example: list all orders with customer name
SELECT o.id AS order_id,
       c.name AS customer,
       o.amount,
       o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;

-- 2️⃣ CTE + window function: top 5 customers by total spend
WITH customer_spend AS (
    SELECT c.id, c.name, SUM(o.amount) AS total_spent
    FROM customers c
    JOIN orders o ON o.customer_id = c.id
    GROUP BY c.id, c.name
)
SELECT id, name, total_spent,
       ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS rank
FROM customer_spend
WHERE rank <= 5;

-- 3️⃣ Set operation: all unique product names from sales and returns
SELECT product_name FROM sales
UNION
SELECT product_name FROM returns;

-- 4️⃣ Subquery in WHERE: customers who spent more than the average spend
SELECT name FROM customers
WHERE id IN (
    SELECT customer_id FROM orders
    GROUP BY customer_id
    HAVING SUM(amount) > (SELECT AVG(total) FROM (
        SELECT SUM(amount) AS total FROM orders GROUP BY customer_id
    ) AS avg_table)
);

-- 5️⃣ EXPLAIN ANALYZE for performance insight
EXPLAIN ANALYZE
SELECT o.id, c.name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
WHERE o.amount > 1000;
```

## ✍️ Exercise (`exercises/03-sql-techniques.md`)

1. **JOIN Exercise** – Write a query that lists each _order_ together with the _product_ name and _quantity_ using the `order_items` and `products` tables.
2. **CTE Challenge** – Create a CTE that calculates the average order amount per customer, then select customers whose average is **above** the global average.
3. **Window Function** – Produce a running total of sales amounts ordered by `order_date`.
4. **Set Operator** – Combine the list of _email addresses_ from the `customers` table with a list from a hypothetical `newsletter_subscribers` table, ensuring no duplicates.
5. **Performance** – Run `EXPLAIN` on one of your queries and note the plan type (Seq Scan vs Index Scan).

## 🧪 Tests (`tests/test_03_sql_techniques.sql`)

```sql
-- Simple sanity test: ensure the CTE query returns at least one row
WITH customer_spend AS (
    SELECT c.id, SUM(o.amount) AS total
    FROM customers c
    JOIN orders o ON o.customer_id = c.id
    GROUP BY c.id
)
SELECT COUNT(*) FROM customer_spend;
```

---

_All files follow the same premium layout used throughout the refresher project._
