# Lesson 02: Accessing JSONB Data

## 📖 Overview
Extracting data from JSONB columns is a core skill when working with document data in Postgres. PostgreSQL offers dedicated operators and built-in functions to traverse objects, extract array elements, and convert JSON structures into relational rows.

---

## 🧠 Key Concepts & Extraction Operators

### 1. JSON Extraction Operators

| Operator | Left Operand | Right Operand | Return Type | Description |
| :--- | :--- | :--- | :--- | :--- |
| `->` | `jsonb` | `text` or `integer` | `jsonb` | Extracts object field by key or array element by 0-based index as **JSONB**. |
| `->>` | `jsonb` | `text` or `integer` | `text` | Extracts object field by key or array element by 0-based index as **text**. |
| `#>` | `jsonb` | `text[]` (path) | `jsonb` | Extracts nested JSON object at specified path array as **JSONB**. |
| `#>>` | `jsonb` | `text[]` (path) | `text` | Extracts nested JSON element at specified path array as **text**. |

> [!IMPORTANT]
> Use `->` or `#>` when you plan to chain further JSON operators or perform JSON operations. Use `->>` or `#>>` when filtering with `WHERE`, ordering with `ORDER BY`, or displaying final scalar values in application code.

---

## 💻 SQL Code Examples

### Direct Field & Path Extraction

```sql
-- Sample JSONB data:
-- {"user": {"name": "Alice", "roles": ["admin", "editor"]}, "active": true}

SELECT 
    -- Returns "Alice" (as jsonb string with quotes: '"Alice"')
    metadata -> 'user' -> 'name' AS name_jsonb,
    
    -- Returns Alice (as scalar text: 'Alice')
    metadata -> 'user' ->> 'name' AS name_text,
    
    -- Returns "admin" (first item of roles array as jsonb)
    metadata -> 'user' -> 'roles' -> 0 AS first_role_jsonb,
    
    -- Using path operator #>> to get nested value directly as text
    metadata #>> '{user, roles, 1}' AS second_role_text
FROM customer_metadata;
```

### Filtering Rows by JSON Attributes

```sql
-- Filtering where nested key equals a text string
SELECT customer_id, metadata
FROM customer_metadata
WHERE metadata -> 'user' ->> 'name' = 'Alice';

-- Using the containment operator (@>) to check if JSONB contains a pattern
SELECT customer_id, metadata
FROM customer_metadata
WHERE metadata @> '{"active": true}';
```

### Expansion Functions: Unnesting JSON to Rows

```sql
-- Expand JSONB key-value pairs into tabular format
SELECT key, value
FROM customer_metadata,
LATERAL jsonb_each(metadata -> 'user');

-- Expand a JSONB array into individual rows
SELECT jsonb_array_elements_text(metadata -> 'user' -> 'roles') AS role
FROM customer_metadata;
```

---

## 🏆 Best Practices

1. **Cast Extracted Text**: When comparing numbers or dates extracted via `->>`, explicitly cast them: `(payload->>'age')::integer > 21`.
2. **Leverage Containment (`@>`)**: When querying with GIN indexes, prefer `@>` over `->>` in the `WHERE` clause whenever possible to hit the GIN index efficiently.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Execute queries exploring object keys, deeply nested arrays, and filtering using `@>` and `->>`.
- **`practice_dvdrental.sql`**: Query payment or rental metadata, extracting custom attributes like device type or payment gateway.
