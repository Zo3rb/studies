# Lesson: Left Joins

## 📖 Overview
A `LEFT JOIN` returns all rows from the left table (table A), and the matched rows from the right table (table B). The result is `NULL` on the right side if there is no match.

## 🧠 Key Concepts
- **Preserving Data:** Crucial when you need a full list from the main table, even if related data is missing.
- **Table Order Matters:** `A LEFT JOIN B` is fundamentally different from `B LEFT JOIN A`.

## 🏆 Best Practices
- Use `LEFT JOIN` when writing reports where you cannot afford to drop rows (e.g., 'Show all customers and their total orders, including customers with 0 orders').
