# 🛑 Lesson 9: Check Constraints in PostgreSQL

A **CHECK constraint** is a database integrity rule that ensures values in one or more columns satisfy a specific boolean condition. If a row fails to meet the condition during an `INSERT` or `UPDATE`, PostgreSQL rejects the transaction, preventing invalid data from entering the database.

---

## 1. Column-Level vs. Table-Level Constraints

### **Column-Level Check Constraints**
Declared directly next to a column's data type. Column-level constraints can only reference the column they are attached to.
```sql
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) CHECK (price > 0) -- Column-level
);
```

### **Table-Level Check Constraints**
Declared at the end of the column list. Table-level constraints can reference **multiple columns** in the same row.
```sql
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2),
    discounted_price NUMERIC(10, 2),
    
    CHECK (discounted_price < price) -- Table-level
);
```

---

## 2. Naming Constraints
If you do not specify a name for your constraint, PostgreSQL will generate one automatically (e.g., `products_price_check`). 

However, it is highly recommended to name your constraints explicitly. When a query violates a constraint, a named constraint returns a clear, readable error message, making debugging much easier:

```sql
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    age INT CONSTRAINT check_minimum_age CHECK (age >= 18)
);
```
*   **Violated error message:**
    `ERROR: new row for relation "users" violates check constraint "check_minimum_age"`

---

## 3. The NULL Trap (Null Bypass)
A critical rule of check constraints is how they handle `NULL` values:
*   A CHECK constraint **passes** if the boolean expression evaluates to `TRUE` **or** if it evaluates to `NULL` (unknown).
*   *Example:* If `price` is `NULL`, `CHECK (price > 0)` evaluates to `NULL`, so the check constraint **passes**!
*   **Best Practice:** Always pair a CHECK constraint with a `NOT NULL` constraint if the value must be both valid and present:
    ```sql
    price NUMERIC(10, 2) NOT NULL CONSTRAINT positive_price CHECK (price > 0)
    ```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to build tables with custom constraints, run validations against column-level / table-level conditions, test constraint name behaviors, and see how NULL bypasses checks.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to check constraints already configured on existing tables (such as `film.rental_rate` or `film.length`) and observe how they are structured in system catalogs.
