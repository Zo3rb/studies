# 🗃️ Lesson 7: Arrays in PostgreSQL

PostgreSQL allows columns to be defined as multi-dimensional arrays of any built-in or user-defined base data type (such as `text[]`, `integer[]`, or `numeric[][]`).

---

## 1. Array Syntax & Declarations

### **Table Definition:**
```sql
CREATE TABLE blog_posts (
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    tags TEXT[] -- Array of text values
);
```

### **Inserting Array Literals:**
```sql
-- 1. Using ARRAY constructor syntax (Recommended):
INSERT INTO blog_posts (title, tags) VALUES 
('Postgres Tips', ARRAY['database', 'sql', 'performance']);

-- 2. Using string literal format:
INSERT INTO blog_posts (title, tags) VALUES 
('Docker Setup', '{"devops", "containers", "docker"}');
```

---

## 2. Array Indexing (1-Based!)

> [!WARNING]
> Unlike most programming languages (Python/JS) which use 0-based indexing, **PostgreSQL arrays are 1-indexed by default**.
> `tags[1]` accesses the **first** element in the array!

```sql
SELECT title, tags[1] AS primary_tag FROM blog_posts;
```

---

## 3. Core Array Functions & Operators

### **1. `unnest(array)` Function**
Expands an array into a set of individual rows (essential for data processing and joins):
```sql
SELECT post_id, unnest(tags) AS individual_tag FROM blog_posts;
```

### **2. `ANY` and `ALL` Constructs**
Check if a value exists inside an array column:
```sql
-- Find all posts where 'sql' is one of the tags
SELECT * FROM blog_posts WHERE 'sql' = ANY(tags);
```

### **3. Array Operators**
*   **`@>` (Contains):** `tags @> ARRAY['sql']`
*   **`<@` (Is Contained By):** `tags <@ ARRAY['sql', 'database', 'tuning']`
*   **`||` (Concatenation):** `tags || 'backend'`

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to create array columns, test 1-based indexing, use `unnest()`, and check `ANY()` search filters.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to parse the `special_features` array column in the `film` table.
