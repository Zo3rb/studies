# Lesson 02: Filtering with WHERE

## 📖 Overview
The `WHERE` clause is the heart of querying. It allows you to filter rows based on specific conditions, returning only the data that matters. Filtering happens *before* the data is aggregated or returned to the user.

## 🧠 Key Concepts
- **Execution Order**: The database filters rows using `WHERE` *before* it applies `SELECT` or `ORDER BY`.
- **Condition Chaining**: You can combine multiple conditions using `AND` and `OR`.
- **Operator Precedence**: `AND` takes precedence over `OR`. Always use parentheses `()` to explicitly group logical conditions and avoid unexpected behavior.

## 🏆 Best Practices
- **Index Usage**: Columns frequently used in `WHERE` clauses are the best candidates for B-Tree indexes.
- **Sargability**: Ensure your `WHERE` clauses are "SARGable" (Search Argument Able). Avoid wrapping indexed columns in functions (e.g., `WHERE LOWER(email) = 'test@example.com'`), as this prevents the database from using a standard index (unless it's a functional index).
