# Lesson 03: Operators and Pattern Matching

## 📖 Overview
Beyond basic equality (`=`) and inequalities (`<`, `>`), PostgreSQL provides powerful operators for lists (`IN`), ranges (`BETWEEN`), and string pattern matching (`LIKE`, `ILIKE`, and Regular Expressions).

## 🧠 Key Concepts
- **`IN (val1, val2)`**: Checks if a value matches any value in a list. Cleaner and faster than multiple `OR` statements.
- **`BETWEEN x AND y`**: Checks if a value is within a range (inclusive of both boundaries).
- **`LIKE` vs `ILIKE`**: 
  - `LIKE` is case-sensitive.
  - `ILIKE` is case-insensitive (PostgreSQL specific).
- **Wildcards**: 
  - `%` matches zero or more characters.
  - `_` matches exactly one character.

## 🏆 Best Practices
- **Trailing vs Leading Wildcards**: `LIKE 'Prefix%'` can use a standard B-Tree index. However, a leading wildcard like `LIKE '%Suffix'` cannot use a standard index and will result in a slow Sequential Scan. Avoid leading wildcards on large tables unless using specialized indexes (like pg_trgm).
