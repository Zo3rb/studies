# 🔗 Lesson 16: Foreign Key Constraints in PostgreSQL

Foreign keys enforce relationships between parent and child tables.

---

## 1. Basic Syntax

```sql
CREATE TABLE departments (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE employees (
    id BIGSERIAL PRIMARY KEY,
    department_id BIGINT REFERENCES departments(id) ON DELETE SET NULL
);
```

---

## 2. Referential Actions

- `ON DELETE CASCADE`
- `ON DELETE SET NULL`
- `ON UPDATE RESTRICT`
- `ON UPDATE CASCADE`

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

