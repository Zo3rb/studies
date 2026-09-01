# 📦 Module 4: Understanding JSON in PostgreSQL

Welcome to **Module 4**! PostgreSQL is widely regarded as the premier relational database for handling document-oriented NoSQL workloads. Native JSON support lets you mix structured relational data with flexible semi-structured JSON documents inside the same database engine.

---

## 📖 Module Lessons & Structure

| Lesson | Topic | Focus & Key Capabilities |
| :--- | :--- | :--- |
| 01 | [Introduction to JSON](./01-Introduction_to_JSON/README.md) | `JSON` vs `JSONB` data types, storage differences, & performance trade-offs |
| 02 | [Accessing JSONB data](./02-Accessing_JSONB_data/README.md) | Operators (`->`, `->>`, `#>`, `#>>`), containment (`@>`), & unnesting functions |
| 03 | [Updating JSON](./03-Updating_JSON/README.md) | In-place modifications with `jsonb_set()`, `jsonb_insert()`, `||`, and `-` |
| 04 | [Generated columns from JSON](./04-Generated_columns_from_JSON/README.md) | Extracting JSON properties into indexed `STORED` generated columns |

---

## 🎯 Key Module Learning Objectives

1. **Understand `JSON` vs `JSONB`**: Recognize why `JSONB` (binary format) is preferred for nearly all production use cases due to fast parsing and GIN indexing support.
2. **Master JSON Extraction**: Learn how to extract values as JSON objects (`->`) versus scalar text (`->>`), and handle nested paths efficiently.
3. **Manipulate JSON Documents**: Perform targeted updates, append nested objects, and delete specific keys without overwriting entire blobs.
4. **Optimize Query Performance**: Combine JSONB with `STORED` generated columns and B-Tree or GIN indexes to achieve sub-millisecond query performance on millions of documents.
