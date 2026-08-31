# Lesson: Returning Data

## 📖 Overview
The `RETURNING` clause can be appended to any `INSERT`, `UPDATE`, or `DELETE` statement to immediately return the modified rows back to the client application.

## 🧠 Key Concepts
- **Avoiding Extra Queries:** Normally, if you insert a row with an auto-incrementing ID, you have to run a second `SELECT` query to find out what ID was assigned. `RETURNING` does this in one step.
- **`RETURNING *`:** Returns the entire modified row.
- **`RETURNING col1, col2`:** Returns specific columns.

## 🏆 Best Practices
- Always use `RETURNING` in your backend application code when inserting records so you immediately get the generated Primary Key without an extra network round-trip to the database.
