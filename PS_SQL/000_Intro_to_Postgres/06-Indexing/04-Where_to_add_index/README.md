# Lesson 04: Where to Add an Index

## 📖 Overview
Adding indexes indiscriminately degrades performance. To build high-performance schemas, you must identify high-cardinality candidate columns found in `WHERE`, `JOIN`, and `ORDER BY` clauses.

---

## 🧠 Key Concepts & Cardinality Rules

### 1. High Selectivity vs Low Selectivity
- **High Selectivity / High Cardinality**: Columns with many unique values (e.g. `email`, `user_id`, `uuid`, `order_number`). **Great candidates for indexing!**
- **Low Selectivity / Low Cardinality**: Columns with very few distinct values (e.g. `gender`, `is_active`, `boolean_flag`). **Poor candidates for B-Tree indexing** because PostgreSQL will prefer a Sequential Scan.

### 2. Prime Candidates for Indexing
1. **Foreign Key Columns**: Columns used in `JOIN` conditions (`orders.customer_id = customers.id`).
2. **Filtered Columns (`WHERE`)**: High-selectivity columns frequently used in filter conditions.
3. **Sorted Columns (`ORDER BY`)**: Columns sorted frequently to eliminate `Sort` node operations in query plans.

---

## 💻 Index Decision Matrix

```
Is the query slow?
 ├── NO  => Don't add an index!
 └── YES => Check column cardinality & filter frequency:
      ├── Low Cardinality (e.g. status='ACTIVE') => Use Partial Index or Skip Index.
      ├── High Cardinality (e.g. email='user@...') => Add B-Tree Index!
      └── Multiple Filter Columns (WHERE tenant_id=1 AND status='ACTIVE') => Add Composite Index!
```

---

## 🏆 Best Practices

- **Partial Indexes**: For low-cardinality columns (e.g. `is_processed = false`), use a Partial Index to index only the relevant subset:
  ```sql
  CREATE INDEX idx_unprocessed_jobs ON jobs (created_at) WHERE is_processed = FALSE;
  ```
- **Measure Before and After**: Always run `EXPLAIN (ANALYZE, BUFFERS)` to verify that your new index is actually being picked up by the query planner.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Compare index performance on high-cardinality vs low-cardinality data.
- **`practice_dvdrental.sql`**: Identify unindexed foreign keys and filter columns in `dvdrental` and evaluate index addition.
