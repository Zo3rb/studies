# 🔤 Lesson 8: Character Types in PostgreSQL

Character data types store text. PostgreSQL has three primary character types, and understanding how they work is key to clean schema design.

---

## 1. The Character Types

| Data Type | Storage Format | Trailing Spaces | Best For |
| :--- | :--- | :--- | :--- |
| **`character varying(n)`** (or `varchar(n)`) | Variable-length with a limit of $n$ characters. | Preserved. | Usernames, email addresses, city names. |
| **`character(n)`** (or `char(n)`) | Fixed-length, space-padded up to $n$ characters. | Padded with spaces on storage; trailing spaces are ignored during comparison. | Fixed-length codes (e.g. ISO 2-character country codes like `US`, state codes). |
| **`text`** | Variable-length, unlimited size (up to 1 GB). | Preserved. | Default text storage, blog post bodies, JSON strings, descriptions. |

*   *Note:* If you declare `varchar` without a length limit (i.e. just `varchar` or `character varying`), it accepts strings of any length, behaving identically to `text`.

---

## 2. The PostgreSQL Storage Myth: `varchar` vs. `text`

In many databases (like MySQL or SQL Server), `VARCHAR` is significantly faster and stores data on-page, while `TEXT`/`BLOB` is stored off-page, making queries slower.

**In PostgreSQL, this is a myth.**
*   Under the hood, `varchar(n)`, `varchar`, and `text` all use the same internal representation (called a `varlena` structure).
*   There is **no performance difference** between them.
*   In fact, using `varchar(n)` adds a tiny processing overhead because PostgreSQL must check the character length limit every time you insert or update a record.
*   **Best Practice:** Use `text` by default for general text. Only use `varchar(n)` if there is a strict business rule constraint (e.g., telephone numbers or zip codes) where validating length is a necessity.

---

## 3. Trailing Spaces in `char(n)`
If you insert `'Postgres'` into a `char(12)` column, PostgreSQL stores it as `'Postgres    '` (padded with 4 spaces).
*   During comparisons (e.g. `col = 'Postgres'`), PostgreSQL implicitly ignores the padding spaces.
*   However, when extracting values, applying string functions, or casting, the spaces remain, which can lead to layout errors in client applications.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql) to check length constraint validations, verify space padding differences between `char(n)` and `varchar(n)`, and experiment with unconstrained types.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to examine table structures and search for text column declarations.
