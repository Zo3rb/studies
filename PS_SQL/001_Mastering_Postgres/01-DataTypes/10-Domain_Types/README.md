# 🏷️ Lesson 10: Domain Types in PostgreSQL

A **DOMAIN** in PostgreSQL is a customized, user-defined data type built on top of an existing base data type (like `TEXT`, `INTEGER`, or `NUMERIC`), enhanced with optional `DEFAULT` values and `CHECK` constraints.

---

## 1. Why Use Domain Types?

In large database systems, the same validation logic often repeats across multiple tables (e.g. valid email format, positive prices, non-negative stock counts, US zip codes).

Without Domains:
*   You must write the same `CHECK` constraint on every table that stores an email or zip code.
*   If the business rule changes, you must alter every table manually.

With Domains:
*   You create a domain type once (e.g. `email_address`).
*   You use `email_address` as the column data type across all your tables.
*   Validation rules are centralized.

---

## 2. Creating and Using a Domain

### **Syntax:**
```sql
CREATE DOMAIN domain_name AS base_data_type
    [ DEFAULT default_value ]
    [ CONSTRAINT constraint_name CHECK (expression) ];
```

### **Example:**
```sql
-- Create a domain for positive monetary amounts
CREATE DOMAIN positive_numeric AS NUMERIC(10, 2)
    CONSTRAINT check_positive CHECK (VALUE > 0);

-- Create a table using the custom domain as a data type
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price positive_numeric -- Uses the domain type!
);
```

> [!NOTE]
> Inside a domain's `CHECK` constraint expression, the keyword `VALUE` refers to the value being inserted or updated into the column.

---

## 3. Modifying and Dropping Domains

*   **Drop a Domain:**
    ```sql
    DROP DOMAIN positive_numeric CASCADE;
    ```
*   **Inspect Domains in System Catalogs:**
    ```sql
    SELECT typname, typtype FROM pg_type WHERE typtype = 'd';
    ```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to create custom domains for email addresses and positive values, test invalid input rejections, and alter table schemas.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to check if any domains exist in the catalog or how custom domains like `year` or `mpaa_rating` work.
