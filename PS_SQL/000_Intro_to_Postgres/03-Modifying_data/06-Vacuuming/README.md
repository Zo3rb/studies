# Lesson: Vacuuming

## 📖 Overview
PostgreSQL uses Multi-Version Concurrency Control (MVCC). When you `UPDATE` or `DELETE` a row, Postgres doesn't actually delete the old data immediately. It marks the old row as a 'dead tuple' and writes a new row. The `VACUUM` command is required to clean up these dead tuples so the disk space can be reused.

## 🧠 Key Concepts
- **Dead Tuples:** Old versions of rows that are no longer visible to any active transaction.
- **Autovacuum:** A background daemon in PostgreSQL that automatically runs `VACUUM` periodically. In modern Postgres, you rarely need to run `VACUUM` manually.
- **`VACUUM FULL`:** Rewrites the entire table to reclaim disk space back to the operating system, but completely locks the table while running.

## 🏆 Best Practices
- Trust the Autovacuum daemon. Only run manual `VACUUM` after massive bulk deletes or updates.
- Avoid `VACUUM FULL` in production unless absolutely necessary due to the heavy exclusive locks it requires.
