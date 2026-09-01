# Lesson 06: Reading EXPLAIN & EXPLAIN ANALYZE Plans

## 📖 Overview
The **`EXPLAIN`** command is the primary diagnostic tool in PostgreSQL. It reveals the Query Optimizer's execution plan, showing which node operations (Seq Scan, Index Scan, Bitmap Heap Scan, Nested Loop, Hash Join) Postgres will execute.

---

## 🧠 Key Concepts & Anatomy of EXPLAIN

### 1. `EXPLAIN` vs `EXPLAIN ANALYZE`
- **`EXPLAIN`**: Shows estimated costs based on database statistics **without** executing the query.
- **`EXPLAIN ANALYZE`**: Actually **executes** the query and returns exact execution times, actual row counts, and loop iterations.

> [!CAUTION]
> Because `EXPLAIN ANALYZE` executes the query, running `EXPLAIN ANALYZE DELETE FROM users;` **will delete data!** Wrap modification statements in a transaction with `ROLLBACK` when profiling updates or deletes!

### 2. Anatomy of a Query Plan Node
```
Seq Scan on rental  (cost=0.00..310.44 rows=16044 width=36) (actual time=0.015..3.412 rows=16044 loops=1)
                      │            │          │             │                  │       │
                Estimated     Estimated   Estimated    Actual Startup   Actual Total Actual Rows
                Start Cost    Total Cost   Row Count      Time (ms)       Time (ms)  Returned
```

### 3. Common Execution Nodes

| Node Type | Description | Performance |
| :--- | :--- | :--- |
| **`Seq Scan`** | Scans entire heap table sequentially. | Good for small tables / large data fetch. |
| **`Index Scan`** | Fetches matching index tuples and reads heap pages. | **Fast** for small selectivity. |
| **`Index Only Scan`** | Reads data strictly from index without touching heap. | **Optimal!** |
| **`Bitmap Index Scan`** | Scans index, builds bitmap of heap pages, then reads heap. | Efficient for multi-column or batch lookups. |
| **`Nested Loop`** | Joins tables by looping over inner table for each outer row. | Fast for small datasets. |
| **`Hash Join`** | Builds in-memory hash table of one relation and probes with second. | Fast for large joins. |

---

## 💻 SQL Code Examples

```sql
-- Safe EXPLAIN ANALYZE profiling of an UPDATE statement inside a transaction
BEGIN;

EXPLAIN (ANALYZE, BUFFERS, VERBOSE)
UPDATE customer
SET last_update = CURRENT_TIMESTAMP
WHERE customer_id = 500;

ROLLBACK;
```

---

## 🏆 Best Practices

- **Always Use `BUFFERS`**: Add `BUFFERS` option (`EXPLAIN (ANALYZE, BUFFERS)`) to see shared memory block hits vs read disk I/O!
- **Watch Out for Cost Discrepancies**: If `estimated rows` is wildly different from `actual rows` (e.g. estimated 1 row, actual 1,000,000 rows), run **`ANALYZE table_name;`** to refresh stale table statistics!

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Analyze cost estimations, buffer hits, and join node behavior on custom tables.
- **`practice_dvdrental.sql`**: Run `EXPLAIN (ANALYZE, BUFFERS)` across complex multi-table joins in `dvdrental`.
