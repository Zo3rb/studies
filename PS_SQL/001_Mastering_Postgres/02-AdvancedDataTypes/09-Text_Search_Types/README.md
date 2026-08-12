# 🔎 Lesson 9: Text Search Types (`tsvector` / `tsquery`)

PostgreSQL full-text search converts text into searchable lexemes with ranking support.

---

## 1. Core Types

- `tsvector`: normalized searchable document
- `tsquery`: structured search query

```sql
to_tsvector('english', 'PostgreSQL full text search')
plainto_tsquery('english', 'full search')
```

---

## 2. Match Operator

```sql
SELECT to_tsvector('english', 'database search optimization')
       @@ plainto_tsquery('english', 'search');
```

`@@` returns `true` when query terms match the vector.

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

