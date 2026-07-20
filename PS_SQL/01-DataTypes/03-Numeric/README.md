# 🔢 Lesson 3: The NUMERIC Type in PostgreSQL

The `NUMERIC` data type (also known as `DECIMAL`) is used to store exact, user-specified precision numbers. It is the gold standard for storing calculations where absolute precision is required, such as financial transactions, interest rates, and scientific constants.

---

## 1. Syntax and Definition

You define a numeric column using two parameters:
```sql
NUMERIC(precision, scale)
```
*   **Precision:** The total number of significant digits in the entire number (both to the left and to the right of the decimal point).
*   **Scale:** The number of decimal digits in the fractional part (to the right of the decimal point).

### **Example: `NUMERIC(5, 2)`**
*   **Total digits (Precision):** 5
*   **Fractional digits (Scale):** 2
*   **Allowed digits before the decimal:** $5 - 2 = 3$ digits.
*   **Range of valid values:** `-999.99` to `999.99`.

---

## 2. Declaring Variations

PostgreSQL allows three ways to declare `NUMERIC`:

1.  **Fully Parameterized (`NUMERIC(p, s)`):** 
    Forces both precision and scale.
2.  **Scale Omitted (`NUMERIC(p)`):**
    Sets the scale to `0` (e.g. `NUMERIC(10)` acts as an exact integer type allowing up to 10 total digits).
3.  **Unspecified (`NUMERIC`):**
    PostgreSQL allows storing numbers of **any** precision and scale up to database limits (up to 131,072 digits before the decimal point, and up to 16,383 digits after it). This is a unique PostgreSQL feature; standard SQL requires specifying the precision.

---

## 3. Storage and Performance

*   **Storage Size:** Variable. Unlike integers (fixed at 2, 4, or 8 bytes), `NUMERIC` requires variable storage depending on the actual value stored:
    $$\text{Storage} = 2 \text{ bytes for every group of 4 decimal digits} + 3\text{ to }8\text{ bytes overhead}$$
*   **Performance Cost:** Arithmetic operations on `NUMERIC` are performed in software rather than on the direct hardware floating-point unit (FPU). Because of this, it is **slower** than integers or floating point numbers (`real` / `double precision`).

---

## 4. Rounding and Overflow Rules

If you insert a value that violates the precision/scale rules:

*   **Too many fractional digits (Scale violation):**
    PostgreSQL does **not** throw an error. It automatically rounds the fractional part to the specified scale.
    *   *Example:* Inserting `10.546` into a `NUMERIC(5, 2)` column stores `10.55`.
*   **Too many whole-number digits (Precision violation):**
    PostgreSQL throws a run-time error:
    ```sql
    -- If column is NUMERIC(5, 2)
    INSERT INTO bills (amount) VALUES (1000.00); 
    -- ERROR: numeric field overflow
    ```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to check scale auto-rounding, precision overflows, and the difference between parameterized and unspecified numeric scales.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to analyze tables storing currency/rates (e.g., `payment.amount`, `film.rental_rate`) and practice custom scale manipulations.
