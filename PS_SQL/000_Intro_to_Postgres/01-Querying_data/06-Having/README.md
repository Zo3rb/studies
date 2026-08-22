# Lesson 06: The HAVING Clause

## 📖 Overview
Because the `WHERE` clause is evaluated *before* data is aggregated, you cannot use aggregate functions like `SUM()` or `COUNT()` inside a `WHERE` clause. This is where `HAVING` comes in. `HAVING` is exactly like `WHERE`, but it is evaluated *after* the `GROUP BY` phase, allowing you to filter based on aggregated metrics.

## 🧠 Key Concepts
- **`WHERE`**: Filters individual rows *before* grouping.
- **`HAVING`**: Filters groups *after* aggregation.
- You can use both in the same query! Filter out bad rows with `WHERE`, group the remaining data, and filter the groups with `HAVING`.

## 🏆 Best Practices
- **Performance**: Always filter as much data as possible using `WHERE` before grouping. Do not use `HAVING` to filter non-aggregated columns.
  - *Bad*: `HAVING category = 'Electronics'` (Should be in WHERE)
  - *Good*: `HAVING SUM(sales) > 1000`
