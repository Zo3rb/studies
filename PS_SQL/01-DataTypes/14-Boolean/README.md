# 🔘 Lesson 14: The BOOLEAN Type in PostgreSQL

The **`BOOLEAN`** data type stores truth values. In PostgreSQL, `BOOLEAN` operates on **Three-Valued Logic (3VL)**:
1.  **`TRUE`**
2.  **`FALSE`**
3.  **`NULL`** (Unknown)

---

## 1. Valid Literal Inputs

PostgreSQL is very flexible when parsing string input into a `BOOLEAN` column:

| Truth State | Accepted Literals (Case-Insensitive) |
| :--- | :--- |
| **`TRUE`** | `TRUE`, `'true'`, `'t'`, `'yes'`, `'y'`, `'1'` |
| **`FALSE`** | `FALSE`, `'false'`, `'f'`, `'no'`, `'n'`, `'0'` |

---

## 2. Boolean Predicates & 3-Valued Logic

When evaluating boolean expressions with `NULL`:
*   `TRUE AND NULL` $\rightarrow$ `NULL`
*   `FALSE AND NULL` $\rightarrow$ `FALSE`
*   `TRUE OR NULL` $\rightarrow$ `TRUE`
*   `NOT NULL` $\rightarrow$ `NULL`

### **Special Predicates:**
To test for truth states without getting `NULL` results, use explicit predicates:
*   `column IS TRUE`
*   `column IS FALSE`
*   `column IS UNKNOWN` (Equivalent to `column IS NULL`)

---

## 3. Best Practices in Queries

Avoid writing redundant comparisons like `WHERE active = true;`. Simply write:
```sql
SELECT * FROM users WHERE active;
```
For negation:
```sql
SELECT * FROM users WHERE NOT active;
```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to test string literal parsers, test 3-valued truth tables, and use boolean predicates.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to query boolean columns like `customer.activebool`.
