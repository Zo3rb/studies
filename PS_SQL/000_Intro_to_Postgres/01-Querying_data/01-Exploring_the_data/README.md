# Lesson 01: Exploring the Data

## 📖 Overview
When you first connect to a new database, your first task is to understand the shape of the data. PostgreSQL provides standard SQL `SELECT` statements, but also powerful metadata commands and clauses like `LIMIT` and `OFFSET` to safely explore large tables without crashing your client or overloading the database.

## 🧠 Key Concepts
- **`SELECT *` vs Explicit Columns**: While `SELECT *` is great for a quick look, always specify explicit columns in production queries to save bandwidth and memory.
- **`LIMIT`**: Restricts the number of rows returned. Essential when exploring multi-million row tables.
- **`OFFSET`**: Skips a specific number of rows before returning data. Often used with `LIMIT` for pagination.
- **`ORDER BY`**: Always pair `LIMIT` with `ORDER BY` if you need consistent results, as databases do not guarantee row order by default.

## 🏆 Best Practices
- **Never run `SELECT * FROM massive_table` without a `LIMIT`.** It can cause out-of-memory errors on your client and unnecessary I/O load on the server.
- Use `LIMIT 1` or `LIMIT 10` to just get a feel for the data structure and sample values.
