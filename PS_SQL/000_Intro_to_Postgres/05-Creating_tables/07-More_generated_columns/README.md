# Lesson 07: More Generated Columns in DDL

## 📖 Overview
Following up on extracted JSON fields, **Generated Columns** can compute values from any scalar expressions involving columns in the same row. They provide clean data encapsulation directly within your DDL tables.

---

## 🧠 Key Concepts & Syntax

### Stored Generated Columns Syntax
```sql
CREATE TABLE table_name (
    col1 type,
    col2 type,
    generated_col type GENERATED ALWAYS AS (expression) STORED
);
```

### Key Rules & Restrictions
1. Must be specified as **`STORED`** (Postgres computes the value on `INSERT`/`UPDATE` and saves it to disk).
2. The generation expression must be **deterministic** (cannot use `random()`, `CURRENT_TIMESTAMP`, or query other tables).
3. Generated columns cannot reference other generated columns.
4. You cannot manually insert or update a value into a generated column directly; it is managed strictly by PostgreSQL.

---

## 💻 SQL Code Examples

```sql
-- Table using generated columns for geometric and monetary calculations
CREATE TABLE invoice_line_items (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name TEXT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
    tax_rate NUMERIC(4,2) NOT NULL DEFAULT 0.05,
    
    -- Generated Column 1: Subtotal before tax
    subtotal NUMERIC(10,2) GENERATED ALWAYS AS (
        quantity * unit_price
    ) STORED,
    
    -- Generated Column 2: Total price including tax
    total_price NUMERIC(10,2) GENERATED ALWAYS AS (
        (quantity * unit_price) * (1 + tax_rate)
    ) STORED
);

-- Inserting base values automatically calculates subtotal and total_price!
INSERT INTO invoice_line_items (product_name, quantity, unit_price, tax_rate)
VALUES ('Database Server License', 2, 500.00, 0.10);

-- Querying the generated columns
SELECT product_name, quantity, unit_price, subtotal, total_price
FROM invoice_line_items;
```

---

## 🏆 Best Practices

- **Encapsulate Common Logic**: Use generated columns for frequently requested derived values (e.g. `full_name`, `total_discount`, `slugs`) to avoid repeating logic across application queries.
- **Index for Speed**: Create B-Tree indexes on generated columns if they are frequently used in `WHERE`, `ORDER BY`, or `JOIN` conditions.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Create sales tables computing tax, gross revenue, and customer full names using generated columns.
- **`practice_dvdrental.sql`**: Test adding generated columns to `film` (e.g., calculating rental rate per minute of length) and checking query plans.
