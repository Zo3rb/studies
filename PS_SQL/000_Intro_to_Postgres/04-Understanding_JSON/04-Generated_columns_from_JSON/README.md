# Lesson: Generated Columns from JSON

## 📖 Overview
Querying JSON directly in `WHERE` clauses can be slow because standard B-Tree indexes don't work on JSON paths. Generated Columns provide a brilliant solution: they automatically extract a JSON field into a standard, typed relational column that you can easily index.

## 🧠 Key Concepts
- **`GENERATED ALWAYS AS (...) STORED`:** Creates a column that is automatically computed by Postgres when a row is inserted or updated. The result is saved (stored) on disk.
- **Bridging NoSQL and SQL:** You can dump unstructured payloads into a JSONB column, but extract the most important fields (like `tenant_id` or `status`) into Generated Columns for blazing fast indexed lookups.

## 🏆 Best Practices
- If you find yourself frequently using `WHERE payload->>'status' = 'active'`, you should absolutely create a Generated Column for `status` and put a standard B-Tree index on it.
