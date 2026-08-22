# Lesson 05: Aggregating Data

## 📖 Overview
Aggregation functions allow you to perform calculations across a set of rows and return a single output row. When paired with `GROUP BY`, you can divide your data into groups and calculate metrics for each group (e.g., total sales per department).

## 🧠 Key Concepts
- **Common Aggregates**: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`.
- **`COUNT(*)` vs `COUNT(column)`**: 
  - `COUNT(*)` counts all rows, including those with NULLs.
  - `COUNT(column)` counts only rows where the column is NOT NULL.
- **`GROUP BY`**: Whenever you mix non-aggregated columns with aggregated functions in a `SELECT`, you **must** include the non-aggregated columns in the `GROUP BY` clause.

## 🏆 Best Practices
- **Execution Order**: `GROUP BY` happens *after* `WHERE`. You cannot use aggregate functions inside a `WHERE` clause.
- Always use aliases (`AS`) for aggregated columns to make your output readable (e.g., `SUM(amount) AS total_revenue`).
