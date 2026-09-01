# Lesson: Updating JSON

## 📖 Overview
When you need to modify a specific key inside a JSONB document, you don't have to pull the entire document to the client, modify it, and push it back. You can use the `jsonb_set` function directly in your `UPDATE` statement.

## 🧠 Key Concepts
- **`jsonb_set(target, path, new_value, [create_missing])`:** Returns a new JSONB object with the specified path updated to the new value.
  - `path` must be a text array (e.g., `'{preferences, theme}'`).
  - `new_value` must be formatted as JSONB, so you often need to quote strings properly or use `to_jsonb()`.

## 🏆 Best Practices
- While `jsonb_set` is powerful, doing frequent nested updates to large JSON documents is a sign that the data might be better suited as standard relational columns. JSON in SQL is best used for semi-structured data that you mostly read, rather than frequently mutate.
