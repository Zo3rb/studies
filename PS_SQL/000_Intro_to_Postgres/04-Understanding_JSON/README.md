# 📦 Module 4: Understanding JSON

Welcome to **Module 4**! Postgres is famously known as the best NoSQL database because of its incredibly powerful native support for JSON. In this module, you will learn how to store, query, and manipulate JSON data.

## 📖 Module Overview

| Lesson | Topic                                                                     | Status |
| :----- | :------------------------------------------------------------------------ | :----: |
| **01** | [Introduction to JSON](./01-Introduction_to_JSON/README.md)               |   📅   |
| **02** | [Accessing JSONB data](./02-Accessing_JSONB_data/README.md)               |   📅   |
| **03** | [Updating JSON](./03-Updating_JSON/README.md)                             |   📅   |
| **04** | [Generated columns from JSON](./04-Generated_columns_from_JSON/README.md) |   📅   |

---

## 🎯 Learning Objectives

By the end of this module, you will understand:

- The fundamental difference between the `JSON` and `JSONB` data types.
- How to extract keys and values from deeply nested JSON documents using Postgres operators (`->`, `->>`).
- How to update specific keys within a JSON blob without overriding the entire document (`jsonb_set`).
- How to use Generated Columns to expose internal JSON fields for easy indexing and standard querying.
