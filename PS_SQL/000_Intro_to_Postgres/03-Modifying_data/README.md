# 📝 Module 3: Modifying data

Welcome to **Module 3**! After mastering how to extract and filter data, it is time to learn how to add, change, and remove data from the database safely.

## 📖 Module Overview

| Lesson | Topic                                               | Status |
| :----- | :-------------------------------------------------- | :----: |
| **01** | [Inserting data](./01-Inserting_data/README.md)     |   📅   |
| **02** | [Updating data](./02-Updating_data/README.md)       |   📅   |
| **03** | [Upserting data](./03-Upserting_data/README.md)     |   📅   |
| **04** | [Returning data](./04-Returning_data/README.md)     |   📅   |
| **05** | [Deleting records](./05-Deleting_records/README.md) |   📅   |
| **06** | [Vacuuming](./06-Vacuuming/README.md)               |   📅   |

---

## 🎯 Learning Objectives

By the end of this module, you will understand:

- How to efficiently add single or multiple rows using `INSERT`.
- How to carefully modify existing rows with `UPDATE`.
- Resolving conflicts seamlessly with `INSERT ... ON CONFLICT` (Upserts).
- Retrieving modified rows instantaneously using the `RETURNING` clause.
- How to safely remove data with `DELETE` and what MVCC means for deleted rows.
- Why and when PostgreSQL needs `VACUUM` to clean up dead tuples.
