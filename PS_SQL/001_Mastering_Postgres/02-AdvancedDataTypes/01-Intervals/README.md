# ⏱️ Lesson 1: Intervals in PostgreSQL

An **`INTERVAL`** data type stores a duration of time (such as 2 hours, 15 days, or 3 months), distinctly separate from a fixed moment in time (like a `TIMESTAMP`).

---

## 1. Syntax and Input Formats

PostgreSQL supports multiple interval input formats:

### **1. Verbose Format (Recommended)**
```sql
INTERVAL '1 year 2 months 3 days 4 hours 5 minutes 6 seconds'
```

### **2. ISO 8601 Format**
```sql
INTERVAL 'P1Y2M3DT4H5M6S' -- P = Period, T = Time delimiter
```

### **3. Abbreviated Format**
```sql
INTERVAL '1 yr 2 mons 3 days 4 hrs'
```

---

## 2. Temporal Arithmetic & `AGE()` Function

### **Interval Arithmetic:**
```sql
-- Calculate expiration date 30 days from now
SELECT NOW() + INTERVAL '30 days';

-- Calculate duration between two timestamps
SELECT '2026-12-31 23:59:59'::timestamp - '2026-01-01 00:00:00'::timestamp;
```

### **The `AGE()` Function:**
The `AGE(timestamp1, timestamp2)` function calculates the exact age or difference between two timestamps, returning an `INTERVAL` broken down into years, months, and days:
```sql
SELECT AGE('2026-07-27'::date, '1995-04-15'::date);
-- Output: 31 years 3 months 12 days
```

---

## 3. Storage & Precision

*   **Storage Size:** 16 bytes (stores months, days, and microseconds separately).
*   **Precision:** You can restrict fractional second precision using `INTERVAL(p)` where $p$ is from 0 to 6 digits.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to test interval addition, sub-second precision, and `AGE()` calculations.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to calculate movie rental durations (`return_date - rental_date`).
