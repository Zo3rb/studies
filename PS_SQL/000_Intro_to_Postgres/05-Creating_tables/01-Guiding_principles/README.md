# Lesson 01: Guiding Principles of Table Design

## 📖 Overview
Designing a database table is not just about choosing column names—it dictates how efficiently PostgreSQL stores data on disk, how fast queries run, and how easy the schema is to maintain over years of software evolution.

---

## 🧠 Key Concepts & Theory

### 1. Normalization Principles
- **First Normal Form (1NF)**: Atomic values per column (no comma-separated lists), unique row identification.
- **Second Normal Form (2NF)**: Meets 1NF, and all non-key columns depend on the entire primary key.
- **Third Normal Form (3NF)**: Meets 2NF, and no non-key column depends on another non-key column (eliminate transitive dependencies).

### 2. PostgreSQL Naming Conventions
- **Case Sensitivity**: Use `snake_case` for table and column names (Postgres folds unquoted identifiers to lowercase).
- **Plurality**: Consistently use plural table names (`users`, `orders`, `payments`) or singular (`user`, `order`, `payment`). Plural is widely standard in Web frameworks.
- **Explicit Foreign Keys**: Name foreign keys after the target entity and primary key (e.g. `customer_id` referencing `customers(id)`).

### 3. Column Alignment & Storage Padding
PostgreSQL aligns data fields on disk based on type size boundaries (e.g., 8-byte integers align on 8-byte boundaries).
- Placing small columns (`SMALLINT`, `BOOLEAN`) between large columns (`BIGINT`, `TIMESTAMPTZ`) inserts hidden alignment padding bytes on disk.
- **Best Practice**: Order table columns by data type size descending (`8-byte` columns first, then `4-byte`, `2-byte`, and variable length `TEXT`/`JSONB` last) to save storage on giant tables!

---

## 💻 SQL Example: Clean Schema Definition

```sql
-- Clean, well-structured table design following best practices
CREATE TABLE order_items (
    -- 8-byte integers and timestamps first (Alignment optimization)
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- 4-byte integers and numerics next
    quantity INT NOT NULL DEFAULT 1,
    unit_price NUMERIC(10,2) NOT NULL,
    
    -- 2-byte / 1-byte types
    discount_percentage SMALLINT NOT NULL DEFAULT 0,
    is_gift BOOLEAN NOT NULL DEFAULT FALSE,
    
    -- Variable length types at the bottom
    special_notes TEXT
);
```

---

## 🏆 Best Practices

- **Avoid Ambiguous Names**: Never name a column `date`, `time`, `id` (in foreign key contexts), or `type`. Use descriptive names like `created_at`, `payment_method`, or `customer_id`.
- **Enforce Constraints Early**: Add constraints during table creation rather than trying to clean up corrupt data later.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Refactor poorly designed legacy tables into clean 3NF structures with alignment optimization.
- **`practice_dvdrental.sql`**: Analyze table structures in `dvdrental` (`film`, `actor`, `rental`) to evaluate column order and normalization.
