# Lesson 03: Dates and Times in PostgreSQL

## 📖 Overview
Handling temporal data correctly is critical for global applications. PostgreSQL provides robust date/time types, precise timezone handling, and rich interval arithmetic.

---

## 🧠 Key Concepts & Golden Rules

### 1. `TIMESTAMP` vs `TIMESTAMPTZ`
- **`TIMESTAMP`** (Without Time Zone): Stores date and time as given. Ignores timezones completely.
- **`TIMESTAMPTZ`** (With Time Zone): Converts input times to UTC for internal storage (8 bytes). When queried, Postgres converts the UTC timestamp back to the timezone of the requesting client session.

> [!IMPORTANT]
> **The Golden Rule**: Always use `TIMESTAMPTZ` for timestamps representing specific moments in time (e.g. `created_at`, `logged_in_at`). Only use `DATE` for calendar dates (e.g., `date_of_birth`) and `TIME` for abstract wall-clock times (e.g., `store_opening_time`).

---

## 💻 SQL Examples & Timezone Operations

```sql
-- Table definition using proper temporal types
CREATE TABLE user_subscriptions (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    activated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMPTZ NOT NULL
);

-- Session timezone conversion
SET TIME ZONE 'America/New_York';

SELECT 
    activated_at AS ny_time,
    activated_at AT TIME ZONE 'UTC' AS utc_time,
    activated_at AT TIME ZONE 'Europe/London' AS london_time
FROM user_subscriptions;

-- Date Arithmetic with INTERVAL
SELECT 
    CURRENT_TIMESTAMP AS now,
    CURRENT_TIMESTAMP + INTERVAL '30 days' AS in_30_days,
    DATE_TRUNC('month', CURRENT_TIMESTAMP) AS start_of_month;
```

---

## 🏆 Best Practices

1. **Default Timestamps**: Use `DEFAULT CURRENT_TIMESTAMP` or `DEFAULT clock_timestamp()` for audit columns.
2. **Truncating Dates**: Use `DATE_TRUNC('day', timestamp_col)` when grouping telemetry data by day, week, or month.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Build event scheduling tables calculating subscription renewal windows using `INTERVAL`.
- **`practice_dvdrental.sql`**: Query rental durations by calculating differences between `rental_date` and `return_date`.
