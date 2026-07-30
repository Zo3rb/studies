# 🔐 Lesson 14: Unique Constraints in PostgreSQL

Unique constraints enforce non-duplicate values for one or more columns.

---

## 1. Column and Composite Uniqueness

```sql
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email TEXT UNIQUE,
    country_code TEXT NOT NULL,
    phone TEXT NOT NULL,
    UNIQUE (country_code, phone)
);
```

---

## 2. Notes

- PostgreSQL allows multiple `NULL` values in a unique column.
- Backed by a unique index automatically.

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

