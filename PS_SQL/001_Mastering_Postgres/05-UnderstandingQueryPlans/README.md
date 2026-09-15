# 🚀 Module 5: Understanding Query Plans

Welcome to **Module 5**! In this module we dive into how PostgreSQL plans and executes queries, how to read the output of `EXPLAIN` and `EXPLAIN ANALYZE`, and how to interpret the different node types.

## 📖 Module Overview

| Lesson | Topic                                                   | Description                                      | Status |
| :----- | :------------------------------------------------------ | :----------------------------------------------- | :----: |
| **01** | [Introduction to EXPLAIN](./01-Introduction/READEME.md) | What `EXPLAIN` does and why it matters           |   📅   |
| **02** | [Explain Structure](./02-Structure/READEME.md)          | Anatomy of the EXPLAIN output                    |   📅   |
| **03** | [Scan Nodes](./03-Scan_Nodes/READEME.md)                | Sequential, index, bitmap, and other scan types  |   📅   |
| **04** | [Cost & Rows](./04-Cost_Rows/READEME.md)                | Understanding cost estimates and row predictions |   📅   |
| **05** | [EXPLAIN ANALYZE](./05-Explain_Analyze/READEME.md)      | Measuring actual execution time and I/O          |   📅   |

## 🎯 Learning Objectives

By the end of this module you will be able to:

- Run `EXPLAIN` and `EXPLAIN ANALYZE` to get a query plan.
- Identify the different plan node types (Seq Scan, Index Scan, Bitmap Heap Scan, etc.).
- Interpret the cost, width, and rows columns.
- Spot common performance pitfalls (misestimated rows, unexpected joins).
- Use `EXPLAIN (ANALYZE, BUFFERS, VERBOSE)` to gain deeper insight.
- Apply plan changes (adding indexes, rewriting queries) to improve performance.

---
