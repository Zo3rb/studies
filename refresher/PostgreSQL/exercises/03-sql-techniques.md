# 📚 03-sql-techniques.md

## 🎯 Learning Objectives

- Master advanced SELECT techniques: **JOINs**, **UNION/INTERSECT**, **subqueries**, **CTEs**.
- Use **window functions** for ranking, running totals, and analytical queries.
- Apply **set operators** to combine result sets.
- Understand **performance considerations** (`EXPLAIN`, indexing hints) for complex queries.

## ✍️ Exercises

1. **JOIN Exercise** – Write a query that lists each order together with the product name and quantity using the `order_items` and `products` tables.
2. **CTE Challenge** – Create a CTE that calculates the average order amount per customer, then select customers whose average is **above** the global average.
3. **Window Function** – Produce a running total of sales amounts ordered by `order_date`.
4. **Set Operator** – Combine the list of email addresses from the `customers` table with a list from a hypothetical `newsletter_subscribers` table, ensuring no duplicates.
5. **Performance** – Run `EXPLAIN` on one of your queries and note the plan type (Seq Scan vs Index Scan).

---

_All files follow the same premium layout used throughout the refresher project._
