# Lesson 02: Choosing the Right Data Types

## 📖 Overview
PostgreSQL offers one of the richest sets of data types of any database system. Selecting the exact type for each attribute reduces disk footprint, enforces validation, and improves CPU cash hit ratios.

---

## 🧠 Key Concepts & Data Type Selection

### 1. Character & Text Types
- `VARCHAR(n)`: Variable-length with a strict maximum limit.
- `CHAR(n)`: Fixed-length, blank-padded. **Rarely recommended** in modern Postgres.
- `TEXT`: Variable-length with unlimited storage (up to 1GB). In Postgres, `TEXT` has **no performance penalty** compared to `VARCHAR(n)`. Prefer `TEXT` unless a strict domain length limit is required.

### 2. Numeric Types
- `SMALLINT` (2 bytes): Range -32,768 to +32,767.
- `INTEGER` (4 bytes): Range -2.1B to +2.1B.
- `BIGINT` (8 bytes): Range -9E18 to +9E18. Default for primary keys in high-volume applications.
- `NUMERIC` / `DECIMAL`: Exact numeric precision. Ideal for currency and financial calculations.
- `REAL` / `DOUBLE PRECISION`: Floating-point types. Fast, but subject to rounding inaccuracies. **Do not use for money!**

### 3. Custom Types: `ENUM` vs Lookup Tables
`ENUM` types restrict column values to a static list of text labels.

```sql
-- Creating a custom ENUM
CREATE TYPE order_status AS ENUM ('pending', 'processing', 'shipped', 'delivered', 'cancelled');

CREATE TABLE orders (
    id BIGINT PRIMARY KEY,
    status order_status NOT NULL DEFAULT 'pending'
);
```

### 4. Array Types
Postgres supports multi-dimensional arrays natively for any valid type.

```sql
CREATE TABLE blog_posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    tags TEXT[] NOT NULL DEFAULT '{}'
);

-- Querying arrays with ANY operator
SELECT * FROM blog_posts WHERE 'postgres' = ANY(tags);
```

---

## 🏆 Best Practices

- **Money & Finance**: Always use `NUMERIC(precision, scale)` or store cents as `BIGINT`. Never use `FLOAT` or `REAL`.
- **`TEXT` Over `VARCHAR`**: Use `TEXT` together with a `CHECK (length(col) <= N)` constraint if you need flexible validation without locking tables when altering limits later.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Create tables utilizing custom ENUMs, domain types, and array columns.
- **`practice_dvdrental.sql`**: Inspect the data types used in `dvdrental` (e.g. `mpaa_rating` enum, `year` domain, `tsvector`).
