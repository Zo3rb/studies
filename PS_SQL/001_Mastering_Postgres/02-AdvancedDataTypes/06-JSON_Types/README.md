# 📄 Lesson 6: JSON Types in PostgreSQL

PostgreSQL has built-in support for storing, querying, and indexing semi-structured **JSON** documents. It provides two native types: **`JSON`** and **`JSONB`**.

---

## 1. `JSON` vs. `JSONB`

| Feature | `JSON` (Textual) | `JSONB` (Binary - Recommended) |
| :--- | :--- | :--- |
| **Storage Format** | Exact copy of input JSON text. | Deconstructed binary format. |
| **Whitespace & Ordering** | Preserves indentations, spaces, & key order. | Removes whitespace & duplicate keys. Reorders keys. |
| **Processing Speed** | Slow (must re-parse JSON on every query). | Fast (parsed once on insert). |
| **Indexing Support** | Regular expression indexes only. | Supports **GIN** (Generalized Inverted) indexes! |

> [!TIP]
> Always use **`JSONB`** unless you strictly need to preserve exact input indentation or duplicate key ordering.

---

## 2. Core JSON Operators

| Operator | Return Type | Description | Example |
| :---: | :---: | :--- | :--- |
| **`->`** | `JSONB` | Get JSON object field by key / array element by index. | `payload -> 'user'` |
| **`->>`** | `TEXT` | Get JSON object field as **text**. | `payload ->> 'email'` |
| **`#>`** | `JSONB` | Get JSON object at specified path array. | `payload #> '{user, address}'` |
| **`#>>`** | `TEXT` | Get JSON object at path array as **text**. | `payload #>> '{user, address, city}'` |
| **`@>`** | `BOOLEAN` | Containment test (does left JSONB contain right JSONB?). | `payload @> '{"status": "active"}'` |
| **`?`** | `BOOLEAN` | Checks if a key string exists in the top-level JSONB. | `payload ? 'tags'` |

---

## 3. Useful JSON Functions

*   **`jsonb_build_object('key', val, ...)`:** Constructs a JSONB object dynamically.
*   **`jsonb_array_elements(jsonb_array)`:** Unnests a JSONB array into a set of rows.
*   **`jsonb_set(target, path, new_value)`:** Updates or adds a nested JSON field.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to create `JSONB` columns, query nested keys with `->` and `->>`, filter with `@>`, and update fields using `jsonb_set()`.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to construct JSON responses dynamically from relational joins.
