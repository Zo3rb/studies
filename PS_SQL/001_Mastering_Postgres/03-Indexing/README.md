# 🔍 Module 3: Indexing

Welcome to **Module 3** of the PostgreSQL journey! This module dives deep into **Indexes**, the most critical tool for database performance optimization. 

## 📖 Module Overview

In this module, we will explore what indexes are, how they work under the hood (Heaps and CTIDs), and how to leverage different B-Tree index strategies effectively.

| Lesson | Topic | Description | Status |
| :--- | :--- | :--- | :---: |
| **01** | [Introduction to Indexes](./01-Introduction_to_Indexes/) | What is an index and why we need them | 🚧 |
| **02** | [Heaps and CTIDs](./02-Heaps_and_CTIDs/) | Table storage architecture and Tuple Identifiers | 📅 |
| **03** | [B-Tree Overview](./03-B_Tree_Overview/) | How the default PostgreSQL B-Tree index works | 📅 |
| **04** | [Primary Keys vs Secondary Indexes](./04-Primary_Keys_vs_Secondary/) | Understanding the difference | 📅 |
| **05** | [Primary Key Types](./05-Primary_Key_Types/) | BigSerial, Identity, UUIDs as PKs | 📅 |
| **06** | [Where to Add Indexes](./06-Where_to_Add_Indexes/) | Identifying columns that benefit from indexing | 📅 |
| **07** | [Index Selectivity](./07-Index_Selectivity/) | Cardinality and why some indexes are ignored | 📅 |
| **08** | [Composite Indexes](./08-Composite_Indexes/) | Indexing multiple columns together | 📅 |
| **09** | [Composite Range](./09-Composite_Range/) | Range queries on composite indexes | 📅 |
| **10** | [Combining Multiple Indexes](./10-Combining_Multiple_Indexes/) | Bitmap Index Scan vs Composite | 📅 |
| **11** | [Covering Indexes](./11-Covering_Indexes/) | Index-Only Scans with the `INCLUDE` clause | 📅 |
| **12** | [Partial Indexes](./12-Partial_Indexes/) | Indexing a subset of data with `WHERE` | 📅 |
| **13** | [Index Ordering](./13-Index_Ordering/) | `ASC`, `DESC` in indexes | 📅 |
| **14** | [Ordering Nulls](./14-Ordering_Nulls/) | `NULLS FIRST`, `NULLS LAST` | 📅 |

---

## 🎯 Learning Objectives

By the end of this module, you will understand:
- How PostgreSQL stores data in pages and heaps.
- Why indexes speed up `SELECT` queries but slow down `INSERT`/`UPDATE` operations.
- The power of B-Trees for equality and range queries.
- How to write covering and partial indexes to drastically reduce I/O.
