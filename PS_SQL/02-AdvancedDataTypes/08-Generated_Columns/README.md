# 🧮 Lesson 8: Generated Columns in PostgreSQL

Generated columns let PostgreSQL compute a column value from other columns automatically.

---

## 1. Syntax

```sql
CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    total_amount NUMERIC(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED
);
```

- `GENERATED ALWAYS AS (...) STORED` means PostgreSQL persists the computed result.
- You cannot directly `INSERT` or `UPDATE` a generated column.

---

## 2. Typical Use Cases

- Financial totals (`qty * unit_price`)
- Normalized/search helper fields (`lower(email)`)
- Safer denormalized computed values with guaranteed consistency

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

