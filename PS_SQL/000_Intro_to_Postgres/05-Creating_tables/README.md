# 📦 Module 5: Creating Tables in PostgreSQL

Welcome to **Module 5**! Creating tables is the foundation of database engineering. Designing schemas with appropriate data types, normalization principles, primary keys, and constraints ensures data integrity, optimal storage efficiency, and maximum query performance.

---

## 📖 Module Lessons & Structure

| Lesson | Topic | Focus & Key Capabilities |
| :--- | :--- | :--- |
| 01 | [Guiding principles](./01-Guiding_principles/README.md) | Relational design, 1NF-3NF normalization, naming conventions, & alignment padding |
| 02 | [Data types](./02-Data_types/README.md) | Choosing numeric, text, `ENUM`, domain types, and array structures |
| 03 | [Dates and times](./03-Dates_and_times/README.md) | `TIMESTAMPTZ` best practices, time zones, interval math, & `DATE_TRUNC()` |
| 04 | [Primary keys](./04-Primary_keys/README.md) | Natural vs surrogate keys, `IDENTITY` columns, and UUIDv4 / UUIDv7 strategies |
| 05 | [Check constraints](./05-Check_constraints/README.md) | `CHECK`, `NOT NULL`, `UNIQUE`, and advanced `EXCLUSION` constraints |
| 06 | [Foreign keys](./06-Foreign_keys/README.md) | Referential integrity, `ON DELETE CASCADE/SET NULL`, and indexing foreign keys |
| 07 | [More generated columns](./07-More_generated_columns/README.md) | Advanced computed columns, expression indexes, and DDL integration |

---

## 🎯 Key Module Learning Objectives

1. **Apply Relational Design Principles**: Structure tables using sound normalization rules while understanding when pragmatic denormalization is acceptable.
2. **Select Proper Storage Types**: Master Postgres-specific types like `TEXT`, `TIMESTAMPTZ`, `NUMERIC`, `UUID`, and custom `ENUM` types.
3. **Enforce Database-Level Integrity**: Write robust `CHECK`, `FOREIGN KEY`, and `EXCLUSION` constraints to catch corrupt data before it hits disk.
4. **Implement Modern Primary Key Patterns**: Transition from legacy `SERIAL` types to modern SQL-standard `GENERATED ALWAYS AS IDENTITY` and UUIDs.
