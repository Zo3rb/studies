# Lesson: Inserting Data

## 📖 Overview
The `INSERT` statement is used to add new rows of data to a table. You can insert a single row, multiple rows in a single query, or even insert the result of another query.

## 🧠 Key Concepts
- **Explicit Columns:** Always specify the column names in your `INSERT` statement. Do not rely on the table's default column order.
- **Bulk Inserts:** Inserting multiple rows in a single `INSERT` statement is vastly more performant than running hundreds of single `INSERT` queries due to reduced transaction overhead.
- **Defaults:** If you omit a column, Postgres will use its `DEFAULT` value (or `NULL` if no default exists).

## 🏆 Best Practices
- Use Multi-row inserts for bulk data loading.
- When building APIs, never use string concatenation to build INSERT statements to avoid SQL Injection; always use parameterized queries.
