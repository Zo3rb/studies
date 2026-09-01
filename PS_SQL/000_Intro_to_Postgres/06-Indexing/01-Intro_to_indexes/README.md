# Lesson 01: Introduction to Database Indexes

## 📖 Overview
An **Index** in PostgreSQL is a separate on-disk data structure that maintains an ordered lookup pointer to table rows. Without an index, PostgreSQL must scan every single page of a table from start to finish (**Sequential Scan**) to find matching rows.

---

## 🧠 Key Concepts & Theory

### 1. Sequential Scan vs Index Scan
- **Sequential Scan (`Seq Scan`)**: Reads every block in the table sequentially. $O(N)$ time complexity. Excellent for small tables or when fetching >20-30% of the entire table.
- **Index Scan (`Index Scan`)**: Traverses an index structure to locate target row pointers, then reads the specific heap pages. $O(\log N)$ search time.

### 2. How Heap Tables & Indexes Work Together
PostgreSQL stores table data in un-ordered pages called the **Heap**. An index does not contain the full row data; it contains indexed column values and a pointer called a **ItemPointer** or **`ctid`** (Block Number, Tuple Index within block) pointing to the corresponding heap page.

```
Index Leaf Page: [ Key: 'Alice' -> ctid: (Block 4, Slot 12) ]
                                      |
                                      v
Heap Page (Block 4): [ Row 12: id=101, name='Alice', email='alice@example.com' ]
```

---

## 💻 SQL Code Examples

```sql
-- Disable sequential scans temporarily in sandbox to demonstrate index usage
SET enable_seqscan = off;

-- Query that will use an index if one exists on customer_id
EXPLAIN ANALYZE
SELECT * FROM rental WHERE customer_id = 341;

-- Creating a simple B-Tree index on a single column
CREATE INDEX idx_rental_customer_id ON rental (customer_id);

-- Verify index creation
SELECT indexname, indexdef 
FROM pg_indexes 
WHERE tablename = 'rental';
```

---

## 🏆 Best Practices

- **Don't Over-Index**: Every index slows down `INSERT`, `UPDATE`, and `DELETE` queries because PostgreSQL must update the index structure on disk for every write.
- **Ignore Small Tables**: PostgreSQL will intentionally choose a Sequential Scan on small tables (e.g. < 1,000 rows) because reading a few cached pages is faster than traversing an index and fetching heap blocks.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Create a 100,000 row test table and compare query speeds with and without a B-Tree index.
- **`practice_dvdrental.sql`**: Inspect default indexes on the `dvdrental` database (`customer`, `film`, `rental`, `payment`).
