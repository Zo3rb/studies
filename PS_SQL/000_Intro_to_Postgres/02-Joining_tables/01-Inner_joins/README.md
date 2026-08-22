# Lesson: Inner Joins

## 📖 Overview
An `INNER JOIN` returns only the rows that have matching values in both tables. It is the most common and restrictive type of join.

## 🧠 Key Concepts
- **Intersection:** Think of a Venn diagram. Inner join returns only the overlapping area.
- **ON Clause:** Specifies the condition that links the tables, typically primary key to foreign key.
- **Aliases:** Always use table aliases (`AS`) to avoid ambiguous column names and keep queries clean.

## 🏆 Best Practices
- Use `INNER JOIN` as your default join unless you explicitly need unmatched rows.
- Be cautious: missing foreign key constraints can lead to dropped rows that you expected to see in an Inner Join.
