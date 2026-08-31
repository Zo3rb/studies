# Lesson: Deleting Records

## 📖 Overview
The `DELETE` statement removes rows from a table. Like `UPDATE`, if you forget the `WHERE` clause, you will delete every row in the table.

## 🧠 Key Concepts
- **Foreign Key Restrictions:** You often cannot delete a row if another table references it via a Foreign Key (unless `ON DELETE CASCADE` is configured).
- **TRUNCATE:** If you truly want to empty an entire table, `TRUNCATE table_name;` is vastly faster than `DELETE FROM table_name;` because it bypasses scanning the rows.

## 🏆 Best Practices
- Always run a `SELECT` with your `WHERE` clause first to ensure you are deleting the correct records.
- Soft Deletes (adding an `is_deleted` boolean column instead of actually running `DELETE`) are often preferred in enterprise applications for audit and recovery purposes.
