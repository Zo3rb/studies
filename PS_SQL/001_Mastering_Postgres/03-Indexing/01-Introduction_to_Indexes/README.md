# Lesson 01: Introduction to Indexes

## 📖 What is an Index?

In PostgreSQL (and most relational databases), an **index** is a separate data structure (like a book's index at the back) that provides quick lookups to the rows in a table. Instead of scanning the entire table from top to bottom (a **Sequential Scan**), the database can consult the index to find the exact location of the required rows (an **Index Scan**).

### ⚡ Why Use Indexes?
1. **Speed Up Reads (`SELECT`):** Indexes drastically reduce the time it takes to find rows matching a `WHERE`, `JOIN`, or `ORDER BY` clause.
2. **Enforce Uniqueness:** `PRIMARY KEY` and `UNIQUE` constraints automatically create a unique index to enforce their rules.

### ⚠️ The Cost of Indexes (Trade-offs)
Indexes aren't free! You should not index every column.
1. **Slower Writes (`INSERT`, `UPDATE`, `DELETE`):** Every time a row is modified, the database must also update the table **and** all associated indexes.
2. **Storage Space:** Indexes are separate data structures saved on disk. Large indexes take up significant storage and memory space.

## 🛠️ Basic Syntax

### Creating an Index
```sql
CREATE INDEX index_name ON table_name (column_name);
```

### Dropping an Index
```sql
DROP INDEX index_name;
```

---

## 🧠 Behind the Scenes: `EXPLAIN`

To know if PostgreSQL is actually using an index, we use the `EXPLAIN` (or `EXPLAIN ANALYZE`) command.

- **Sequential Scan (Seq Scan):** The database reads the entire table from disk. Used for small tables or when fetching a large percentage of rows.
- **Index Scan:** The database reads the index to find the locations, then fetches those specific rows from the table.

```sql
EXPLAIN SELECT * FROM users WHERE email = 'test@example.com';
```
