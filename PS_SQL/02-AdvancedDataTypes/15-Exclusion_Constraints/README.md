# 🚫 Lesson 15: Exclusion Constraints in PostgreSQL

Exclusion constraints prevent conflicting rows using custom operators (often with ranges).

---

## 1. Core Pattern

```sql
CREATE EXTENSION IF NOT EXISTS btree_gist;

ALTER TABLE bookings
ADD CONSTRAINT bookings_no_overlap
EXCLUDE USING gist (
    room_id WITH =,
    booking_slot WITH &&
);
```

This blocks overlapping bookings for the same room.

---

## 2. Typical Use Cases

- Room or meeting scheduling
- Validity periods
- Non-overlapping geometric or temporal allocations

---

## 🛠️ Practice Exercises

1. Run [practice_trainings.sql](./practice_trainings.sql) in `trainings`.
2. Run [practice_dvdrental.sql](./practice_dvdrental.sql) in `dvdrental`.

