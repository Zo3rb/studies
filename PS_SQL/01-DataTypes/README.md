# 📊 Module 1: PostgreSQL Data Types

Welcome to **Module 1: Data Types** of our PostgreSQL learning journey! PostgreSQL has a rich, industry-leading set of native data types. Selecting the proper data type is critical for storage optimization, CPU efficiency, query performance, and data integrity—fundamental skills for database engineering and data representation in AI/ML pipelines.

This module is aligned directly with the course: **"Mastering Postgres - A video course on PostgreSQL"**.

---

## 🎯 Module Objective
To master the usage, storage constraints, arithmetic behaviors, and gotchas of all PostgreSQL data types, backed by hands-on practice scripts executed on:
1. **`trainings` Database:** Schema creation, DDL/DML constraints, boundaries, and error tests.
2. **`dvdrental` Database:** Analytical querying, system catalog inspection, and real-world aggregations.

---

## 📂 Complete Module 1 Navigation

| Lesson | Topic & Link | Key Concepts Covered | Status |
| :---: | :--- | :--- | :---: |
| **01** | [01-Schema_Introduction](./01-Schema_Introduction/README.md) | Schemas, namespaces, `public` schema, `search_path`, name collisions | ✅ Complete |
| **02** | [02-Integers](./02-Integers/README.md) | `smallint`, `integer`, `bigint`, overflow, `SERIAL` sequences, integer division | ✅ Complete |
| **03** | [03-Numeric](./03-Numeric/README.md) | `NUMERIC(p, s)`, exact decimals, auto-rounding vs precision overflow | ✅ Complete |
| **04** | [04-Floating_Point](./04-Floating_Point/README.md) | `real`, `double precision`, IEEE 754 binary float inexactness, scientific notation | ✅ Complete |
| **05** | [05-Storing_Money](./05-Storing_Money/README.md) | Native `money` type vs `NUMERIC` vs cent-based `INTEGER` patterns | ✅ Complete |
| **06** | [06-NaNs_Infinity](./06-NaNs_Infinity/README.md) | `Infinity`, `-Infinity`, `NaN`, arithmetic rules, PostgreSQL sorting sequence | ✅ Complete |
| **07** | [07-Casting_Types](./07-Casting_Types/README.md) | Implicit vs explicit casts, `CAST()` vs `::`, rounding rules, invalid casts | ✅ Complete |
| **08** | [08-Character_Types](./08-Character_Types/README.md) | `char(n)`, `varchar(n)`, `text`, padding, PostgreSQL `varlena` storage model | ✅ Complete |
| **09** | [09-Check_Constraints](./09-Check_Constraints/README.md) | Column vs table-level rules, named constraints, `NULL` bypass trap | ✅ Complete |
| **10** | [10-Domain_Types](./10-Domain_Types/README.md) | User-defined `DOMAIN`, centralized validation, regex constraints | ✅ Complete |
| **11** | [11-Chars_Collations](./11-Chars_Collations/README.md) | String collation rules, binary `"C"` collation vs locale-aware sorting | ✅ Complete |
| **12** | [12-Binary_Data](./12-Binary_Data/README.md) | `BYTEA`, raw binary storage, Hex `\x` format, `encode()` and `decode()` Base64 | ✅ Complete |
| **13** | [13-UUIDs](./13-UUIDs/README.md) | 128-bit UUIDs, security vs `SERIAL`, distributed primary keys, `gen_random_uuid()` | ✅ Complete |
| **14** | [14-Boolean](./14-Boolean/README.md) | `BOOLEAN`, 3-Valued Logic (3VL), literal string parsers, boolean predicates | ✅ Complete |
| **15** | [15-Enums](./15-Enums/README.md) | `ENUM`, 4-byte storage efficiency, status ordering, `ALTER TYPE ADD VALUE` | ✅ Complete |
| **16** | [16-Timestamps_Dates](./16-Timestamps_Dates/README.md) | `DATE`, `TIME`, `TIMESTAMPTZ` (UTC storage), `INTERVAL` math, `DATE_TRUNC()` | ✅ Complete |

---

## 🛠️ Practice Environments & Structure

Every lesson directory follows a uniform structure:
```bash
PS_SQL/01-DataTypes/<Lesson_Folder>/
├── README.md                      # Comprehensive theory, comparisons, gotchas, & syntax
├── practice_trainings.sql         # DDL/DML exercises, constraint tests, and error checks for 'trainings' DB
└── practice_dvdrental.sql         # Analytical queries, catalog inspection, & aggregations for 'dvdrental' DB
```
