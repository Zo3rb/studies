# 🧩 Lesson 10: Bit Strings in PostgreSQL

PostgreSQL supports fixed and variable-length bit strings for compact flags and masks.

---

## 1. Types

- `BIT(n)`: fixed length
- `BIT VARYING(n)` / `VARBIT(n)`: variable length up to `n`

```sql
CREATE TABLE device_flags (
    id SERIAL PRIMARY KEY,
    permissions BIT(8) NOT NULL
);
```

---

## 2. Useful Operators

- `&` bitwise AND
- `|` bitwise OR
- `#` bitwise XOR
- `~` bitwise NOT

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

