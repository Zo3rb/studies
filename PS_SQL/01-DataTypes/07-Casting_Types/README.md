# 🔄 Lesson 7: Casting Types in PostgreSQL

**Type Casting** is the process of converting a value from one data type to another. In strongly-typed databases like PostgreSQL, you must frequently cast values explicitly to perform operations, match function signatures, or prepare data for application consumption.

---

## 1. Casting Syntax

PostgreSQL supports two primary casting syntaxes:

### **1. Standard SQL Syntax (`CAST`)**
Portability-friendly and conforms to standard SQL specifications:
```sql
SELECT CAST(amount AS INTEGER) FROM payment;
```

### **2. PostgreSQL Shorthand Syntax (`::`)**
A quick, concise syntax unique to PostgreSQL. Highly preferred in day-to-day scripting:
```sql
SELECT amount::INTEGER FROM payment;
```

---

## 2. Implicit vs. Explicit Casting

*   **Implicit Casting:**
    PostgreSQL performs conversions automatically when there is no ambiguity.
    *   *Example:* Adding an `integer` to a `numeric` automatically converts the integer to numeric to execute the calculation.
    *   *Example:* Inserting a formatted string `'2026-07-20'` into a `DATE` column automatically casts it.
*   **Explicit Casting:**
    Required when a conversion is potentially lossy, ambiguous, or lacks an implicit cast path.
    *   *Example:* Casting a `double precision` to an `integer` (rounds the decimals).
    *   *Example:* Converting a `boolean` value to an `integer` (must be done explicitly).

---

## 3. Common Casting Scenarios & Rules

### **Numeric to Integer**
*   Casting a decimal (`numeric` or `float`) to an `integer` rounds the value to the nearest whole integer.
*   *Example:* `12.5::int` rounds to `13`. `12.4::int` rounds to `12`.

### **Text to Numeric/Date**
*   Casting string characters representing numbers or dates to their respective types:
    ```sql
    SELECT '12.34'::numeric;
    SELECT '2026-07-20'::date;
    ```
*   **Warning:** If the string does not match the target type's input syntax, PostgreSQL throws a run-time error:
    ```sql
    SELECT 'hello'::integer; 
    -- ERROR: invalid input syntax for type integer: "hello"
    ```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to try explicit casting paths, observe rounding behaviors, and catch conversion errors.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to convert data types on the fly (e.g. converting money to integers or grouping transactions by casted date formats).
