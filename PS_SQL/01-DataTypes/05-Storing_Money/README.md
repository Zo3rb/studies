# 💵 Lesson 5: Storing Money in PostgreSQL

PostgreSQL includes a dedicated native `money` data type. However, in professional database design, using the `money` type is frequently discouraged. 

Let's explore how to store financial data and why different patterns are used.

---

## 1. The Native `money` Type
The `money` data type stores currency amounts with a fixed fractional precision.
*   **Storage:** 8 bytes.
*   **Output Formatting:** Automatically formatted with currency symbols and thousands separators (e.g., `$1,234.56`) based on the database server's **locale** setting (`lc_monetary`).

### **Why `money` is Discouraged:**
1.  **Locale Dependence:** The output formatting depends on the server's locale. If you backup a database on a server with US locale (`$`) and restore it on a server with EU locale (`€`), the database may interpret or display the values incorrectly.
2.  **Single Currency Constraint:** A table cannot store Euros in one row and Dollars in another under the same `money` column; it is bound to the server's configuration currency.
3.  **Fractional Limitations:** It always uses a fixed number of decimal places (usually 2). It cannot store fractions of a cent (e.g. gas prices like `$3.149` or interest rates).

---

## 2. Better Alternative 1: `NUMERIC(precision, scale)`
The most common industry practice is storing exact monetary values using `NUMERIC(12, 2)` or `NUMERIC(15, 4)`:
*   Allows precise arithmetic.
*   Does not depend on server configuration.
*   Allows storing fractions of a cent when needed (e.g., stock trades at `0.0001` precision).
*   **Application handling:** Currency symbols (`$`, `€`) are formatted in the backend application, not the database.

---

## 3. Better Alternative 2: Cent-Based `INTEGER` or `BIGINT`
For high-frequency or large-scale financial applications:
*   Instead of storing `$12.34` as a decimal, store it as **`1234`** (in cents or mills) using an `integer` or `bigint` column.
*   **Benefits:** Arithmetic is performed natively on CPU hardware registers (extremely fast), and there is zero risk of decimal rounding bugs.
*   **Drawback:** The application layer must divide the value by 100 before displaying it to users.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to check how the native `money` type formats data, test currency parsing limits, and compare it to the `NUMERIC` and `INTEGER` design patterns.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to see which design pattern was used for the payment amounts in a real sample application.
