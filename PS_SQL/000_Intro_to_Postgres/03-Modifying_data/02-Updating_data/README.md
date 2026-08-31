# Lesson: Updating Data

## 📖 Overview
The `UPDATE` statement modifies existing data in a table. Because it permanently changes data, it must be used with extreme caution—specifically with the `WHERE` clause.

## 🧠 Key Concepts
- **The Danger Zone:** An `UPDATE` without a `WHERE` clause will update *every single row* in the table.
- **Column Assignment:** You can update multiple columns at once by separating them with commas (e.g., `SET col1 = x, col2 = y`).

## 🏆 Best Practices
- Always write your `WHERE` clause as a `SELECT` statement first to verify exactly which rows you are about to modify before running the `UPDATE`.
