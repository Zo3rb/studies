# 📅 Lesson 16: Timestamps, Dates, and Timezones in PostgreSQL

Managing temporal data accurately across global time zones, daylight savings shifts, and reporting intervals is one of the most critical aspects of database engineering.

---

## 1. Temporal Data Types Overview

| Data Type | Storage | Format / Description | Best For |
| :--- | :--- | :--- | :--- |
| **`DATE`** | 4 bytes | Date only (`YYYY-MM-DD`). | Birthdays, holidays, accounting end-dates. |
| **`TIME`** | 8 bytes | Time of day only (`HH:MI:SS.mmmmmm`). | Store opening hours, shift start times. |
| **`TIMESTAMP`** | 8 bytes | Date and time without timezone (`YYYY-MM-DD HH:MI:SS`). | Localized events with no timezone context. |
| **`TIMESTAMPTZ`** | 8 bytes | Date and time **WITH** timezone awareness. | **Gold Standard** for logs, transactions, user actions. |
| **`INTERVAL`** | 16 bytes | Time duration (e.g., `'2 days 3 hours'`). | Event durations, subscription lengths, expiration calculations. |

---

## 2. Why `TIMESTAMPTZ` is the Gold Standard

A common misconception is that `TIMESTAMPTZ` stores the original timezone string alongside the timestamp.

**How `TIMESTAMPTZ` Actually Works:**
1.  **On Input:** When you insert a timestamp with a timezone offset (e.g., `'2026-07-22 10:30:00+03'`), PostgreSQL converts the input to **UTC** (Coordinated Universal Time) and stores the UTC value internally.
2.  **On Output:** When you query the value, PostgreSQL reads the UTC value and automatically converts it to the timezone set for your current database session (`SHOW TimeZone;`).

> [!IMPORTANT]
> Always use `TIMESTAMPTZ` for timestamps representing actual moments in time to avoid daylight savings bugs and cross-timezone data corruption!

---

## 3. Date Arithmetic & Interval Math

PostgreSQL supports intuitive arithmetic on dates and timestamps using `INTERVAL`:

```sql
-- Add 7 days to the current timestamp
SELECT NOW() + INTERVAL '7 days';

-- Calculate difference between two timestamps
SELECT '2026-12-31'::date - '2026-01-01'::date AS days_difference;
```

---

## 4. Key Temporal Functions

### **1. `EXTRACT()` / `DATE_PART()`**
Extracts specific fields (Year, Month, Day, Hour, Day of Week):
```sql
SELECT EXTRACT(MONTH FROM NOW());
```

### **2. `DATE_TRUNC()`**
Truncates a timestamp to a specified precision (useful for `GROUP BY` aggregations by month, week, or hour):
```sql
SELECT DATE_TRUNC('month', NOW()); -- Truncates to first day of the month at 00:00:00
```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to test session timezones, interval math, and date truncation.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to analyze payment trends over time using `DATE_TRUNC()` and `EXTRACT()`.
