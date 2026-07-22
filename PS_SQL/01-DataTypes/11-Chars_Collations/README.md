# 🌐 Lesson 11: Chars and Collations in PostgreSQL

A **Collation** is a set of rules that governs how character string data (`TEXT`, `VARCHAR`, `CHAR`) is sorted and compared. It determines case sensitivity, accent handling, and alphabetical ordering across different human languages and alphabets.

---

## 1. What is a Collation?

When you run an `ORDER BY` query on a text column, PostgreSQL needs to know:
*   Does `'a'` come before `'B'`?
*   Are `'e'` and `'é'` treated as identical or distinct?
*   Should strings be sorted by raw binary byte values or by human language dictionary rules?

This behavior is determined by the **Collation**.

---

## 2. Key Collations in PostgreSQL

1.  **`"C"` / `POSIX` (Binary Collation):**
    *   Sorts strings strictly by their underlying ASCII / UTF-8 byte numeric values.
    *   **Performance:** Fastest possible string comparison performance.
    *   **Sorting behavior:** All uppercase letters (`A-Z`) come before all lowercase letters (`a-z`). E.g. `'Apple' < 'Zebra' < 'banana'`.
2.  **Locale-Aware Collations (e.g. `"en_US.utf8"`, `"fr_FR.utf8"`):**
    *   Sorts strings according to specific human language rules.
    *   **Sorting behavior:** Respects dictionary ordering regardless of case or accent rules defined by the locale.

---

## 3. Applying Collations

You can apply collations at three different levels:

### **1. Column-Level Definition (In Table DDL):**
```sql
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name TEXT COLLATE "en_US.utf8"
);
```

### **2. Per-Query Expression (In SELECT / ORDER BY):**
Override the default collation for a specific query:
```sql
SELECT name FROM authors ORDER BY name COLLATE "C";
```

### **3. Inspect Available Collations:**
```sql
SELECT collname, collprovider FROM pg_collation LIMIT 20;
```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to compare binary `"C"` collation sorting against dictionary language sorting.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to practice applying `COLLATE "C"` to sort film titles.
