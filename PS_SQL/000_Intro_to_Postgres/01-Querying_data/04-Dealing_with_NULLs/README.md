# Lesson 04: Dealing with NULLs

## 📖 Overview
In SQL, `NULL` represents a missing or unknown value. It is **not** zero, and it is **not** an empty string. Because `NULL` means "unknown", comparing a value to `NULL` using standard operators (`=`, `!=`) will always result in `NULL` (unknown), not True or False.

## 🧠 Key Concepts
- **`IS NULL` / `IS NOT NULL`**: The only safe way to check if a column is or isn't `NULL`. You cannot use `= NULL`.
- **`COALESCE(val1, val2, ...)`**: Returns the first non-null value in the list. Excellent for providing default values when data is missing.
- **NULLs in Math**: Any mathematical operation involving a `NULL` results in `NULL` (e.g., `5 + NULL = NULL`).

## 🏆 Best Practices
- **Design**: If a column should absolutely always have a value, use a `NOT NULL` constraint in your schema.
- **Reporting**: Use `COALESCE` in `SELECT` statements to format reports nicely so business users see 'N/A' or '0' instead of a blank NULL.
