# Lesson: Accessing JSONB Data

## 📖 Overview
Postgres provides specialized operators to drill down into a JSON document and extract exactly what you need.

## 🧠 Key Concepts
- **`->` Operator:** Gets JSON object field by key. Returns the result as a `JSON` type. Can be chained.
- **`->>` Operator:** Gets JSON object field by key, but returns the result as `TEXT`. This is the one you will use most often to compare values in a `WHERE` clause.
- **`#>` and `#>>` Operators:** Extracts data at a specified path (using an array of keys/indexes).

## 🏆 Best Practices
- Use `->` when you need to chain down multiple levels (`payload->'user'->'address'`), and finish the chain with `->>` when you want the final primitive value to cast or compare (`payload->'user'->>'email'`).
