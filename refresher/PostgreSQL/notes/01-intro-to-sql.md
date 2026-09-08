# PG4E Week 1 — Single Table SQL (01-Intro-to-SQL)

This lesson follows Dr. Charles Severance's (Dr. Chuck) **PostgreSQL for Everybody (PG4E)** course, Week 1: *Single Table SQL* (referencing `01-Intro-to-SQL.ppt`).

---

## 1. Relational Database Concepts & Vocabulary

A **Relational Database Management System (RDBMS)** manages data in structured tables (relations).

- **Database**: An organized container managed by PostgreSQL containing schema objects.
- **Table (Relation)**: A set of rows (tuples) sharing the same column definitions (attributes).
- **Row (Tuple)**: A single record representing an individual entity or event.
- **Column (Attribute)**: A typed field holding scalar values (e.g. `INTEGER`, `TEXT`, `TIMESTAMP`).
- **Primary Key (PK)**: A column or set of columns uniquely identifying every row in a table.
- **SQL (Structured Query Language)**: The ANSI/ISO standard language used to interact with PostgreSQL.

---

## 2. PostgreSQL Client-Server Architecture

```text
+-----------------------+              SQL Queries              +-------------------------+
|     psql Client       | ------------------------------------> |    PostgreSQL Server    |
| (Command Line / App)  | <------------------------------------ |   (Database Engine)     |
+-----------------------+              Result Sets              +-------------------------+
```

- **Client (`psql`)**: Transmits SQL commands over TCP/IP to the database engine and formats returned rows.
- **Server (`postgres`)**: Parses SQL queries, optimizes execution plans, enforces constraints, and reads/writes blocks on disk.

### Critical `psql` Command Line Rules
1. **Semicolon Requirement**: Every SQL statement **must** end with a semicolon `;`. Without `;`, `psql` waits for more lines.
2. **Meta-Commands**: Begin with a backslash `\` and do **not** require semicolons:
   - `\l` : List all databases.
   - `\c dbname` : Connect to a specific database.
   - `\dt` : List all tables in current schema.
   - `\d table_name` : Describe columns and constraints of a table.
   - `\q` : Quit `psql`.

---

## 3. Core SQL Statements (Single Table CRUD)

SQL statements are categorized into DDL, DML, and DQL:

### A. Data Definition Language (DDL) — Table Structure

```sql
-- Remove existing table safely
DROP TABLE IF EXISTS users;

-- Create a single table with primary key and data types
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    email VARCHAR(128) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
```

### B. Data Manipulation Language (DML) — Modifying Data

```sql
-- 1. INSERT: Add new rows
INSERT INTO users (name, email) VALUES ('Chuck Severance', 'csev@umich.edu');
INSERT INTO users (name, email) VALUES ('Colleen van Lent', 'cvan@umich.edu');

-- 2. UPDATE: Modify existing rows (ALWAYS use WHERE!)
UPDATE users 
SET name = 'Charles Severance' 
WHERE email = 'csev@umich.edu';

-- 3. DELETE: Remove rows (ALWAYS use WHERE!)
DELETE FROM users 
WHERE email = 'cvan@umich.edu';
```

> [!WARNING]
> **Never run `UPDATE` or `DELETE` without a `WHERE` clause** unless you intend to modify or wipe every single row in the entire table!

### C. Data Query Language (DQL) — Retrieving Data

```sql
-- Select all columns and rows
SELECT * FROM users;

-- Select specific columns with filtering, ordering, and pagination
SELECT id, name, email 
FROM users 
WHERE email LIKE '%@umich.edu' 
ORDER BY id DESC 
LIMIT 5 OFFSET 0;
```

---

## 🧠 Maths & DSA Insights

### 1. Relational Algebra & Set Theory
- A table is a **Relation** defined as a subset of the Cartesian Product of column domains:
  $$R \subseteq D_1 \times D_2 \times \dots \times D_n$$
- SQL operations map directly to relational operators:
  - **Selection ($\sigma_{\text{predicate}}$)**: `WHERE` clause filters rows.
  - **Projection ($\pi_{\text{columns}}$)**: `SELECT col1, col2` filters columns.
- **Unordered Sets**: Relational tables do **not** guarantee row order. Without an explicit `ORDER BY` clause, the returned row order is non-deterministic ($\mathcal{O}(1)$ insertion order may drift due to updates/deletes).

### 2. Search Complexity ($\mathcal{O}$)
- **Unindexed Scan (Sequential Scan)**: Filtering via `WHERE non_pk_col = val` scans every page on disk in $\mathcal{O}(N)$ time.
- **Indexed Primary Key Lookup**: Searching via `WHERE id = 42` traverses the B-Tree index in $\mathcal{O}(\log N)$ time.

### 3. Three-Valued Logic (3VL) & `NULL`
In relational algebra, `NULL` represents missing or unknown data. SQL uses **Three-Valued Logic**: `TRUE`, `FALSE`, and `UNKNOWN`.

| Operator | Expression | Evaluation |
| :--- | :--- | :--- |
| `=` | `NULL = NULL` | `UNKNOWN` (NOT True!) |
| `IS` | `NULL IS NULL` | `TRUE` |
| `WHERE` | `WHERE NULL` | Excludes row (requires `TRUE`) |

- **DSA Best Practice**: Always test for missing values using `IS NULL` or `IS NOT NULL`. Never use `= NULL`.

---

## 🧪 Summary Checklist for PG4E Week 1

- [x] Connected to PostgreSQL using `psql`.
- [x] Created table using `CREATE TABLE` with `PRIMARY KEY`.
- [x] Performed `INSERT`, `SELECT`, `UPDATE`, and `DELETE` operations.
- [x] Verified `psql` meta-commands (`\dt`, `\d`).
- [x] Evaluated $\mathcal{O}(N)$ vs $\mathcal{O}(\log N)$ search complexity and Three-Valued Logic.
