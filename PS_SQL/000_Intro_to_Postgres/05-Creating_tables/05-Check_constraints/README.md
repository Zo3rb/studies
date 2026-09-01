# Lesson 05: Check & Data Integrity Constraints

## 📖 Overview
Enforcing data integrity at the database layer ensures that invalid or corrupt data can **never** be saved, regardless of bugs or changes in application code. PostgreSQL provides flexible `CHECK`, `UNIQUE`, and `EXCLUSION` constraints.

---

## 🧠 Key Concepts & Constraint Types

### 1. `CHECK` Constraints
Logical boolean expressions evaluated on every `INSERT` or `UPDATE`. If the expression evaluates to `TRUE` or `NULL`, the constraint succeeds; if it returns `FALSE`, the transaction aborts with an error.

```sql
CREATE TABLE employees (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name TEXT NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    termination_date DATE,
    
    -- Single-column check constraint
    CONSTRAINT chk_positive_salary CHECK (salary > 0),
    
    -- Multi-column check constraint
    CONSTRAINT chk_valid_employment_dates CHECK (
        termination_date IS NULL OR termination_date >= hire_date
    )
);
```

### 2. `UNIQUE` Constraints
Ensures values in a column or set of columns are unique across all rows in the table. Automatically creates a supporting B-Tree index.

### 3. Advanced: `EXCLUSION` Constraints
Exclusion constraints generalize uniqueness. They ensure that if any two rows are compared on specified columns using specified operators, at least one comparison returns false. Perfect for preventing overlapping date ranges!

```sql
-- Example: Prevent booking overlapping time slots for the same conference room
CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE TABLE room_bookings (
    booking_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_id INT NOT NULL,
    booking_period TSTZRANGE NOT NULL,
    
    -- Prevents overlapping ranges for the same room_id
    EXCLUDE USING gist (
        room_id WITH =,
        booking_period WITH &&
    )
);
```

---

## 🏆 Best Practices

- **Name Your Constraints Explicitly**: Always provide custom constraint names (`CONSTRAINT chk_price_positive`) so database error messages in your application logs clearly indicate which rule failed!
- **Safe Constraint Addition**: When adding constraints to existing multi-gigabyte tables, use `ADD CONSTRAINT ... NOT VALID` followed by `ALTER TABLE ... VALIDATE CONSTRAINT` to prevent long exclusive table locks.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Implement multi-column check constraints verifying pricing discounts and date validation logic.
- **`practice_dvdrental.sql`**: Inspect constraints on `customer` (email validation, active flag) and `film` (rental_rate, replacement_cost checks).
