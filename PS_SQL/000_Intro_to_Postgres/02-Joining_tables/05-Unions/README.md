# Lesson: Unions

## 📖 Overview
While Joins combine columns horizontally, `UNION` combines rows vertically. It allows you to append the result set of two different queries into a single column structure.

## 🧠 Key Concepts
- **`UNION` vs `UNION ALL`:**
  - `UNION` automatically removes duplicate rows (expensive sorting operation).
  - `UNION ALL` appends all rows exactly as they are (much faster).
- **Rules:** Both queries must return the exact same number of columns, and the data types must align in order.

## 🏆 Best Practices
- Always use `UNION ALL` unless you explicitly *need* to deduplicate the resulting dataset, as `UNION` introduces a hidden `DISTINCT` operation overhead.
