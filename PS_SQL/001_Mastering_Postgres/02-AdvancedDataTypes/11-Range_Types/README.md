# 📏 Lesson 11: Range Types in PostgreSQL

Range types represent an interval between lower and upper bounds.

---

## 1. Common Range Types

- `int4range` (integer ranges)
- `numrange` (numeric ranges)
- `daterange` (date ranges)
- `tsrange` / `tstzrange` (timestamp ranges)

---

## 2. Core Operators

- `@>` contains element/range
- `&&` overlaps
- `<@` contained by

```sql
SELECT daterange('2026-01-01', '2026-02-01', '[)') && daterange('2026-01-20', '2026-03-01', '[)');
```

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

