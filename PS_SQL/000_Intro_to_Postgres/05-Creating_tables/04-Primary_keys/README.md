# Lesson 04: Primary Key Strategies

## 📖 Overview
A Primary Key uniquely identifies each row in a table. Selecting the right primary key strategy—whether auto-incrementing integers, natural keys, or UUIDs—impacts index size, insert performance, and security.

---

## 🧠 Key Concepts & Primary Key Patterns

### 1. `IDENTITY` Columns (Modern SQL Standard)
Replaces legacy `SERIAL` types. `IDENTITY` columns use standard ANSI SQL syntax, prevent accidental manual value overrides, and manage underlying sequence objects cleanly.

```sql
CREATE TABLE products (
    -- GENERATED ALWAYS prevents accidental manual INSERTs into the ID column
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL
);
```

### 2. Natural Keys vs Surrogate Keys
- **Natural Key**: A real-world attribute that is naturally unique (e.g., ISO Country Codes like `'US'`, `'CA'`).
- **Surrogate Key**: An artificially generated identifier (e.g., Auto-incrementing `BIGINT` or `UUID`).

### 3. UUID Primary Keys (Universally Unique Identifiers)
Ideal for distributed systems, microservices, and preventing sequential ID enumeration vulnerabilities.

```sql
-- Using built-in gen_random_uuid() (Postgres 13+)
CREATE TABLE API_keys (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_name TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
```

---

## 📊 Primary Key Strategy Comparison

| Strategy | Storage Size | Read/Write Efficiency | Security / Privacy | Best Use Case |
| :--- | :--- | :--- | :--- | :--- |
| `IDENTITY` (`BIGINT`) | 8 Bytes | **Maximum** (Sequential B-Tree inserts) | Predictable (Enumeration risk) | Internal tables, high-speed joins |
| `UUIDv4` (`UUID`) | 16 Bytes | Good (Random insert fragmentation) | **High** (Cryptographically random) | User IDs, public-facing APIs |
| `Natural Key` | Variable | Depends on type | Depends on value | Reference tables (e.g., Country codes) |

---

## 🏆 Best Practices

- **Prefer `BIGINT` Over `INT`**: `INT` maxes out at 2.1 billion rows. Converting a 32-bit primary key to 64-bit on a production table with millions of rows requires expensive table rewrites!
- **Use `IDENTITY` Instead of `SERIAL`**: `GENERATED ALWAYS AS IDENTITY` is safer and conforms to standard SQL.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Benchmark tables using `IDENTITY` vs `UUID` primary keys.
- **`practice_dvdrental.sql`**: Examine primary key strategies used across `customer_id`, `film_id`, and `rental_id`.
