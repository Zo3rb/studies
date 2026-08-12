# ⚡ Module 2: PostgreSQL Advanced Data Types & Constraints

Welcome to **Module 2: Advanced Data Types & Constraints** of our PostgreSQL learning journey! Building on basic data types, this module covers complex PostgreSQL data structures (JSON, Arrays, Ranges, Composite Types), sequence generators (SERIAL, Sequences, IDENTITY columns), system constraints (Unique, Exclusion, Foreign Keys), and data integrity patterns.

This module is directly aligned with the course: **"Mastering Postgres - A video course on PostgreSQL"**.

---

## 🎯 Module Objective

To master advanced PostgreSQL data types and constraints, including semi-structured JSON storage, multi-dimensional arrays, range bounds, sequence mechanisms, generated columns, and foreign key integrity. Exercises are executed on:
1. **`trainings` Database:** Schema creation, DDL/DML constraints, boundary checks, and error tests.
2. **`dvdrental` Database:** Analytical querying, schema catalog inspection, and relational join practices.

---

## 📂 Complete Module 2 Navigation

| Lesson | Topic & Link | Key Concepts Covered | Status |
| :---: | :--- | :--- | :---: |
| **01** | [01-Intervals](./01-Intervals/README.md) | `INTERVAL` syntax, ISO 8601, temporal arithmetic, precision settings | ✅ Complete |
| **02** | [02-Serial_Type](./02-Serial_Type/README.md) | `smallserial`, `serial`, `bigserial`, sequence dependencies, gap behaviors | ✅ Complete |
| **03** | [03-Sequences](./03-Sequences/README.md) | `CREATE SEQUENCE`, `nextval()`, `currval()`, `setval()`, cache & cycle options | ✅ Complete |
| **04** | [04-Identity_Columns](./04-Identity_Columns/README.md) | `GENERATED ALWAYS AS IDENTITY`, SQL standard compliance vs SERIAL | ✅ Complete |
| **05** | [05-Network_Address_Types](./05-Network_Address_Types/README.md) | `inet`, `cidr`, `macaddr`, IP subnet containment operators (`<<=`, `>>`) | ✅ Complete |
| **06** | [06-JSON_Types](./06-JSON_Types/README.md) | `JSON` vs `JSONB`, JSON operators (`->`, `->>`), containment (`@>`), JSON path | ✅ Complete |
| **07** | [07-Arrays](./07-Arrays/README.md) | Array columns (`text[]`), `ANY`, `ALL`, `unnest()`, `array_append()`, indexing | ✅ Complete |
| **08** | [08-Generated_Columns](./08-Generated_Columns/README.md) | `GENERATED ALWAYS AS (...) STORED`, virtual computation, restrictions | ✅ Complete |
| **09** | [09-Text_Search_Types](./09-Text_Search_Types/README.md) | `tsvector`, `tsquery`, full-text search operators (`@@`), lexeme normalization | ✅ Complete |
| **10** | [10-Bit_Strings](./10-Bit_Strings/README.md) | `BIT(n)`, `BIT VARYING(n)`, bitwise bitmask operators (`&`, `|`, `#`, `~`) | ✅ Complete |
| **11** | [11-Range_Types](./11-Range_Types/README.md) | `int4range`, `daterange`, `tsrange`, bounds (`[`, `)`), overlap (`&&`), containment (`@>`) | ✅ Complete |
| **12** | [12-Composite_Types](./12-Composite_Types/README.md) | `CREATE TYPE ... AS (...)`, custom row structures, nested attributes | ✅ Complete |
| **13** | [13-NULL_Handling](./13-NULL_Handling/README.md) | Three-valued logic, `COALESCE()`, `NULLIF()`, `IS DISTINCT FROM` | ✅ Complete |
| **14** | [14-Unique_Constraints](./14-Unique_Constraints/README.md) | `UNIQUE`, composite unique keys, NULL handling in unique indexes | ✅ Complete |
| **15** | [15-Exclusion_Constraints](./15-Exclusion_Constraints/README.md) | `EXCLUDE USING gist`, non-overlapping ranges, scheduling double-booking prevention | ✅ Complete |
| **16** | [16-Foreign_Key_Constraints](./16-Foreign_Key_Constraints/README.md) | `FOREIGN KEY`, `ON DELETE CASCADE`, `ON UPDATE RESTRICT`, referential integrity | ✅ Complete |

---

## 🛠️ Practice Environments & Structure

Every lesson directory follows a uniform structure:
```bash
PS_SQL/02-AdvancedDataTypes/<Lesson_Folder>/
├── README.md                      # Comprehensive theory, comparisons, gotchas, & syntax
├── practice_trainings.sql         # DDL/DML exercises, constraint tests, and error checks for 'trainings' DB
└── practice_dvdrental.sql         # Analytical queries, catalog inspection, & aggregations for 'dvdrental' DB
```
