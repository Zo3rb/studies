# 🔢 Lesson 4: Floating-Point Types in PostgreSQL

Floating-point data types are **variable-precision, inexact** numeric representations. They are designed to store fractional values across a huge dynamic range, but they trade exact decimal precision for hardware performance and scale.

---

## 1. Floating-Point Types

PostgreSQL provides two native floating-point types conforming to the **IEEE 754** standard:

| Data Type | Storage Size | Precision | Range |
| :--- | :--- | :--- | :--- |
| **`real`** | 4 bytes | 6 decimal digits | $-3.40 \times 10^{38}$ to $+3.40 \times 10^{38}$ |
| **`double precision`** | 8 bytes | 15 decimal digits | $-1.79 \times 10^{308}$ to $+1.79 \times 10^{308}$ |

In standard SQL, you can also use `float(p)` where $p$ is the binary precision. PostgreSQL maps `float(1)` to `float(24)` to `real`, and `float(25)` to `float(53)` to `double precision`.

---

## 2. The Concept of "Inexact"
"Inexact" means that some values cannot be represented exactly in the computer's binary memory.
*   *Why?* Computers store numbers using binary fractions (powers of 2). Fractions like $1/2$ ($0.5$), $1/4$ ($0.25$), and $3/8$ ($0.375$) have exact representations.
*   Fractions like $1/10$ ($0.1$) or $1/5$ ($0.2$) have repeating binary fractions (similar to $1/3 = 0.3333...$ in base 10).
*   **Result:** Doing math with floats can yield minor rounding errors:
    ```sql
    SELECT 0.1::real + 0.2::real;
    -- Might yield 0.30000001192092896 instead of exactly 0.3
    ```

---

## 3. When to Use Floating-Point Types
*   **Best for:** Science simulations, engineering calculations, geography coordinates (GPS latitude/longitude), graphics metrics, temperature logging, and machine learning model weights.
*   **Never use for:** Currency, inventory balances, tax rates, or accounting balances where every penny must reconcile. (Always use `NUMERIC` or `INTEGER` for money!).

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to observe IEEE 754 binary math behavior and precision boundaries.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to inspect if any columns are defined as floats and test coordinate calculations.
