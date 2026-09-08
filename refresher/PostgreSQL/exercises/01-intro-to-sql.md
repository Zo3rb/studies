# Exercise 1 — Single Table SQL (PG4E Week 1)

This exercise reinforces **Single Table SQL** concepts from Dr. Chuck's PG4E course (Week 1 / `01-Intro-to-SQL.ppt`).

---

## 🎯 Task Instructions

Write a series of SQL statements to manage a single table called `automatch` simulating an automated autograder dataset.

### Step 1: Create Table DDL
Create a table named `automatch` with the following schema:
- `id`: Auto-incrementing primary key (`SERIAL PRIMARY KEY`).
- `title`: String up to 128 characters, cannot be null (`VARCHAR(128) NOT NULL`).
- `code`: Unique string up to 64 characters (`VARCHAR(64) UNIQUE NOT NULL`).
- `score`: Numeric score between 0 and 100 (`INT CHECK (score >= 0 AND score <= 100)`).
- `submitted_at`: Timestamp with time zone, defaulting to current timestamp (`TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP`).

### Step 2: Insert Data
Insert the following 4 records into `automatch`:

| title | code | score |
| :--- | :--- | :--- |
| `'Python Basics'` | `'PY01'` | `95` |
| `'Postgres Setup'` | `'PG01'` | `88` |
| `'Data Modeling'` | `'PG02'` | `72` |
| `'Algorithms'` | `'AL01'` | `100` |

### Step 3: Query & Filter
1. Retrieve all records with `score >= 85` ordered by `score` in descending order.
2. Retrieve records where `code` starts with `'PG'` (using `LIKE`).

### Step 4: Update & Delete
1. Update `'Data Modeling'` (`PG02`) score to `80`.
2. Delete the record with `code = 'PY01'`.

---

## 🧪 Expected Output Verification

### Query 1: Filter `score >= 85` ORDER BY `score DESC`

```text
 id |    title     | code | score 
----+--------------+------+-------
  4 | Algorithms   | AL01 |   100
  1 | Python Basics| PY01 |    95
  2 | Postgres Setup| PG01|    88
```

### Query 2: Filter `code LIKE 'PG%'`

```text
 id |     title      | code | score 
----+----------------+------+-------
  2 | Postgres Setup | PG01 |    88
  3 | Data Modeling  | PG02 |    80
```

### Final Table Verification (`SELECT * FROM automatch ORDER BY id;`)

```text
 id |     title      | code | score 
----+----------------+------+-------
  2 | Postgres Setup | PG01 |    88
  3 | Data Modeling  | PG02 |    80
  4 | Algorithms     | AL01 |   100
```

---

## 🧠 Maths & DSA Discussion Questions

1. **Time Complexity**: What is the time complexity ($\mathcal{O}$) of searching for a row by `id` versus searching by `title` when `title` is not indexed?
2. **Set Semantics**: Why does SQL `SELECT * FROM automatch` without an `ORDER BY` clause not guarantee row order across multiple queries?
3. **Constraint Validation**: What error occurs if you attempt to execute `INSERT INTO automatch (title, code, score) VALUES ('Test', 'PG01', 50);`? Why?
