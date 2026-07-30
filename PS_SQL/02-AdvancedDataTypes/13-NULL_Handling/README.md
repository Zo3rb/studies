# ❓ Lesson 13: NULL Handling in PostgreSQL

`NULL` means unknown/missing, not zero or empty string. SQL uses three-valued logic (`TRUE`, `FALSE`, `UNKNOWN`).

---

## 1. Core Functions and Predicates

- `COALESCE(a, b, c)` → first non-null value
- `NULLIF(a, b)` → null when values are equal
- `IS NULL` / `IS NOT NULL`
- `IS DISTINCT FROM` (null-safe comparison)

---

## 2. Common Pitfalls

- `= NULL` is always wrong; use `IS NULL`
- `NOT IN` with nullable lists can produce unexpected results

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

