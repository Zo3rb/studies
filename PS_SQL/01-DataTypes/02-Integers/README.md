# 🔢 Lesson 2: Integers in PostgreSQL

Integers are whole numbers (both positive and negative, including zero). In database design, choosing the correct integer size is vital for optimizing storage, memory consumption, and index efficiency.

---

## 1. The Integer Datatypes

PostgreSQL provides three primary integer types:

| Data Type | Storage Size | Range | Common Use Cases |
| :--- | :--- | :--- | :--- |
| **`smallint`** | 2 bytes | $-32,768$ to $+32,767$ | Status flags, ratings (e.g., 1–5), age, month, day of week. |
| **`integer`** (or `int`) | 4 bytes | $-2,147,483,648$ to $+2,147,483,647$ | Default for IDs, quantities, page views, loop counters. |
| **`bigint`** | 8 bytes | $-9.22 \times 10^{18}$ to $+9.22 \times 10^{18}$ | High-traffic IDs, global timestamps, large financial values. |

---

## 2. Integer Overflow
Unlike some scripting languages (like Python) where integers automatically grow to arbitrary sizes, PostgreSQL enforces strict hardware-level storage limits.
*   If you attempt to insert or calculate a value that exceeds the bounds of the column type, PostgreSQL raises an error:
    ```sql
    -- If column is SMALLINT
    INSERT INTO test_table (small_col) VALUES (32768);
    -- ERROR: smallint out of range
    ```

---

## 3. Auto-Incrementing Integers (Serial Types)
PostgreSQL doesn't have an `AUTO_INCREMENT` keyword like MySQL. Instead, it uses **Sequences** behind the scenes. The `serial` keywords are placeholders that automatically handle sequence creation:

*   **`smallserial`** (2 bytes): Max value 32,767.
*   **`serial`** (4 bytes): Max value 2,147,483,647.
*   **`bigserial`** (8 bytes): Max value 9,223,372,036,854,775,807.

**Under the Hood:**
```sql
CREATE TABLE items (
    id SERIAL PRIMARY KEY
);
```
PostgreSQL translates the above code to:
```sql
CREATE SEQUENCE items_id_seq;
CREATE TABLE items (
    id INTEGER DEFAULT nextval('items_id_seq') PRIMARY KEY
);
ALTER SEQUENCE items_id_seq OWNED BY items.id;
```

---

## 4. Integer Division Behavior
A common point of confusion is dividing two integers:
*   Dividing an integer by another integer in SQL results in **integer division** (it truncates the fractional part, rather than rounding it).
    ```sql
    SELECT 5 / 2; -- Returns 2 (integer)
    ```
*   To get a fractional result, you must cast one of the numbers to a floating-point/numeric type, or use a decimal literal:
    ```sql
    SELECT 5 / 2.0;       -- Returns 2.5000000000000000 (numeric)
    SELECT 5::numeric / 2; -- Returns 2.5000000000000000 (numeric)
    ```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to check boundaries, observe auto-increment sequences, and inspect internal sequence configurations.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to explore integer columns and practice integer math operations.
