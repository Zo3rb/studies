# Lesson: Right Joins

## 📖 Overview
A `RIGHT JOIN` returns all rows from the right table, and matched rows from the left table. It is the exact mirror of a `LEFT JOIN`.

## 🧠 Key Concepts
- **Symmetry:** `A RIGHT JOIN B` is identical to `B LEFT JOIN A`.
- **Readability:** Most developers read top-to-bottom, left-to-right. Therefore, `LEFT JOIN` is heavily preferred in the industry.

## 🏆 Best Practices
- Avoid `RIGHT JOIN` unless absolutely necessary to modify a deeply nested, auto-generated query. Always prefer rewriting it as a `LEFT JOIN` for better team readability.
