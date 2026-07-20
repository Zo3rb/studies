# ♾️ Lesson 6: NaNs and Infinity in PostgreSQL

PostgreSQL supports special values for floating-point (`real`, `double precision`) and `numeric` data types that represent calculations outside normal ranges:
1.  **`Infinity`**: Positive Infinity.
2.  **`-Infinity`**: Negative Infinity.
3.  **`NaN`**: Not-a-Number (represents an undefined or unrepresentable numerical result).

---

## 1. Creating and Inserting Special Values

Special values are written as strings and cast to the target numeric type:

```sql
SELECT 'Infinity'::double precision;
SELECT '-Infinity'::real;
SELECT 'NaN'::numeric;
```

When inserting them into a table, simply provide the string values:
```sql
INSERT INTO items (price) VALUES ('Infinity');
INSERT INTO items (price) VALUES ('NaN');
```

---

## 2. Math Operations with Specials

Special values follow standard mathematical limits:

*   **Operations with Infinity:**
    *   `Infinity + 5` = `Infinity`
    *   `Infinity * 2` = `Infinity`
    *   `Infinity - Infinity` = `NaN`
*   **Operations with NaN:**
    *   Any arithmetic operation involving `NaN` will result in `NaN`:
        *   `NaN + 10` = `NaN`
        *   `NaN * 0` = `NaN`

> [!NOTE]
> Dividing a normal number by zero (e.g. `1 / 0`) in standard PostgreSQL SQL queries will throw a division-by-zero error rather than returning `Infinity` or `NaN`. To get Infinity/NaN, calculations are typically cast from floats or passed from external programming languages (like Python or JavaScript data imports).

---

## 3. The PostgreSQL Sorting Order Quirk
In standard database operations, we need to sort lists (`ORDER BY`). PostgreSQL must know how to order special values compared to standard numbers.

PostgreSQL defines the sorting order of numeric types as follows (from smallest to largest):

$$\mathbf{-Infinity} \quad < \quad \mathbf{\text{Normal Numbers}} \quad < \quad \mathbf{Infinity} \quad < \quad \mathbf{NaN}$$

*   **Why is `NaN` the largest?** 
    PostgreSQL treats `NaN` as greater than `Infinity` so that when you sort in ascending order, all `NaN` values group together at the absolute end of the list.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to test inserting special values, run math checks on them, and see the sorting order behavior.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to see how to filter out `NaN` or `Infinity` values when performing analytical data exports.
