# Lesson 02: Characteristics & Overhead of Indexes

## 📖 Overview
While indexes dramatically accelerate read performance, they are not free. Understanding the trade-offs—including disk footprint, write amplification, maintenance overhead, and HOT (Heap-Only Tuples) updates—is essential for database architects.

---

## 🧠 Key Concepts & Characteristics

### 1. Write Amplification (The "Index Penalty")
Every time you `INSERT`, `UPDATE`, or `DELETE` a row:
- The database updates the main Heap table page.
- **And** updates every single index defined on that table.
- If a table has 10 indexes, a single `INSERT` results in 1 heap write + 10 index writes!

### 2. Disk Footprint
Indexes consume RAM (buffer pool) and disk space. In heavy OLTP databases, total index size often exceeds table data size!

### 3. HOT Updates (Heap-Only Tuples)
PostgreSQL optimization where an `UPDATE` that does **not** change any indexed column stores the new version of the row on the same heap page. This avoids updating all indexes, drastically reducing write amplification.

---

## 📊 Summary Trade-offs

| Operation | Without Index | With Index | Impact |
| :--- | :--- | :--- | :--- |
| **SELECT (Point lookup)** | Slow ($O(N)$) | **Fast ($O(\log N)$)** | High speedup |
| **INSERT** | Fast ($O(1)$) | Slower | Extra write per index |
| **UPDATE (Indexed col)** | Standard | Slower | Must update index pointer |
| **UPDATE (Non-indexed)** | Standard | **Fast (HOT Update)** | Bypasses index updates |
| **DELETE** | Standard | Slower | Must remove index pointers |

---

## 💻 SQL Code Examples

```sql
-- Checking index size vs table size in PostgreSQL
SELECT 
    relname AS table_name,
    pg_size_pretty(pg_relation_size(c.oid)) AS table_size,
    pg_size_pretty(pg_indexes_size(c.oid)) AS total_indexes_size
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind = 'r' AND n.nspname = 'public'
ORDER BY pg_relation_size(c.oid) DESC;
```

---

## 🏆 Best Practices

- **Audit Unused Indexes**: Use `pg_stat_user_indexes` to drop indexes that receive zero index scans over time.
- **Leverage HOT Updates**: Keep indexes minimal on high-frequency `UPDATE` tables to maximize HOT updates.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Benchmark write speed differences when inserting 50,000 rows into a table with 0 indexes vs 5 indexes.
- **`practice_dvdrental.sql`**: Calculate table size vs total index size for the `dvdrental` database.
