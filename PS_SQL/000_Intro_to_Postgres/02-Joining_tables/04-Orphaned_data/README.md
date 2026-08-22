# Lesson: Orphaned Data

## 📖 Overview
Orphaned data refers to rows that reference a non-existent foreign key, or simply finding rows in one table that do not exist in another (the Anti-Join).

## 🧠 Key Concepts
- **Anti-Join Pattern:** Using `LEFT JOIN` combined with a `WHERE right_table.id IS NULL` is the standard SQL way to find missing relationships.
- **Data Integrity:** Orphaned data is a sign of poor database design or a missing `FOREIGN KEY` constraint.

## 🏆 Best Practices
- Always enforce `FOREIGN KEY` constraints to prevent orphaned data.
- Use the Anti-Join pattern to clean up legacy databases before applying constraints.
