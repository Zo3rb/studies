# 🧱 Lesson 12: Composite Types in PostgreSQL

Composite types allow bundling multiple fields into one custom structured type.

---

## 1. Create and Use Composite Types

```sql
CREATE TYPE full_name_type AS (
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE students (
    id BIGSERIAL PRIMARY KEY,
    full_name full_name_type NOT NULL
);
```

Access fields with `(column).field_name`.

---

## 2. When to Use

- Encapsulating strongly related attributes
- Function input/output signatures
- Reusable domain modeling in SQL-only workflows

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

