# Lesson 04: Generated Columns from JSON

## 📖 Overview
Storing JSON is easy, but querying nested JSON keys repeatedly across millions of rows can introduce performance bottlenecks and syntax verbosity. **Generated Columns** let you extract nested JSONB attributes into standard, typed database columns that automatically update and can be indexed with traditional B-Tree indexes.

---

## 🧠 Key Concepts & Benefits

### Why Use Generated Columns with JSON?
1. **Simplified SQL**: Query standard column names (`WHERE user_email = '...'`) instead of verbose JSON operators (`WHERE payload #>> '{user, email}' = '...'`).
2. **Type Safety & Constraints**: Apply standard SQL constraints (`NOT NULL`, `UNIQUE`, `CHECK`) directly on extracted JSON attributes.
3. **B-Tree Index Support**: While GIN indexes work on entire JSONB documents, standard B-Tree indexes on generated columns are much smaller, faster for exact lookups, and support scalar range queries (`>`, `<`).

> [!NOTE]
> PostgreSQL supports **`STORED`** generated columns. The value is computed upon `INSERT`/`UPDATE` and physically written to disk alongside other column data.

---

## 💻 SQL Code Examples

```sql
-- Table storing raw API payloads with generated columns for fast querying
CREATE TABLE order_events (
    event_id SERIAL PRIMARY KEY,
    raw_event JSONB NOT NULL,
    
    -- Extracting order_id as integer
    order_id INT GENERATED ALWAYS AS (
        (raw_event ->> 'order_id')::INT
    ) STORED,
    
    -- Extracting customer email as text
    customer_email TEXT GENERATED ALWAYS AS (
        raw_event #>> '{customer, email}'
    ) STORED,
    
    -- Extracting total amount as numeric
    total_amount NUMERIC(10,2) GENERATED ALWAYS AS (
        (raw_event ->> 'total_amount')::NUMERIC
    ) STORED
);

-- Indexing the generated columns with standard B-Tree indexes!
CREATE INDEX idx_order_events_customer_email ON order_events(customer_email);
CREATE INDEX idx_order_events_order_id ON order_events(order_id);

-- Inserting a JSON payload automatically populates the generated columns!
INSERT INTO order_events (raw_event)
VALUES ('{
    "order_id": 4501,
    "total_amount": 129.99,
    "customer": {"name": "Bob Smith", "email": "bob@example.com"}
}');

-- Fast, clean, indexed B-Tree query!
SELECT order_id, customer_email, total_amount
FROM order_events
WHERE customer_email = 'bob@example.com';
```

---

## 🏆 Best Practices

- **Use Expressions Wisely**: Expressions in generated columns must be **immutable** (they cannot reference external tables or non-deterministic functions like `NOW()`).
- **Combine JSONB + Generated Columns**: Store the raw flexible JSON for future-proofing, and generate typed columns for high-frequency query filters.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Build an event logging system that parses incoming JSON telemetry into indexed generated columns.
- **`practice_dvdrental.sql`**: Extract customer preferences from JSON metadata into generated columns and verify index usage using `EXPLAIN`.
