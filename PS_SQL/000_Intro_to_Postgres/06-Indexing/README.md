# ⚡ Module 6: Indexing in PostgreSQL

Welcome to **Module 6**, the final core module of **Intro to Postgres**! Indexes are specialized data structures that speed up data retrieval operations on a database table at the cost of additional write overhead and storage. Mastering indexes is the single most effective way to turn slow, resource-heavy queries into sub-millisecond execution plans.

---

## 📖 Module Lessons & Structure

| Lesson | Topic | Focus & Key Capabilities |
| :--- | :--- | :--- |
| 01 | [Intro to indexes](./01-Intro_to_indexes/README.md) | Fundamentals of database indexes, Sequential Scan vs Index Scan |
| 02 | [Characteristics of index](./02-Characteristics_of_index/README.md) | B-Tree index properties, write amplification, maintenance, & storage costs |
| 03 | [Btree structure](./03-Btree_structure/README.md) | Deep-dive into B-Tree nodes, root/leaf pages, tuple pointers (`ctid`), & log(N) lookup |
| 04 | [Where to add index](./04-Where_to_add_index/README.md) | Identifying candidate columns (`WHERE`, `JOIN`, `ORDER BY`), cardinality, & selectivity |
| 05 | [Composite indexes](./05-Composite_indexes/README.md) | Multi-column indexes, column ordering rules, left-prefix matching, & index-only scans |
| 06 | [Explain](./06-Explain/README.md) | Query execution plans, analyzing `EXPLAIN (ANALYZE, BUFFERS)`, cost estimates, & node types |

---

## 🎯 Key Module Learning Objectives

1. **Understand Index Mechanics**: Learn why B-Tree is the default index type in PostgreSQL and how page structures enable $O(\log N)$ search complexity.
2. **Evaluate Query Performance**: Use `EXPLAIN` and `EXPLAIN ANALYZE` to read execution plans and identify bottleneck operations.
3. **Design Strategic Indexes**: Know exactly which columns to index based on selectivity, query patterns, and join conditions.
4. **Master Multi-Column Indexing**: Build optimal composite indexes leveraging column ordering rules to serve `WHERE`, `JOIN`, and `ORDER BY` clauses simultaneously.
