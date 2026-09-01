# Lesson 01: Introduction to JSON & JSONB

## 📖 Overview
PostgreSQL provides two distinct native data types for storing JSON documents: `JSON` and `JSONB`. While both validate that input text conforms to RFC 7159 JSON specifications, their underlying storage architecture, performance characteristics, and feature sets differ dramatically.

---

## 🧠 Key Concepts & Theory

### 1. `JSON` (Textual Storage)
- **Storage**: Stores an exact verbatim copy of the input text string.
- **Formatting**: Preserves whitespace, indentation, duplicate keys, and original key ordering.
- **Parsing Overhead**: Must re-parse the raw JSON string every time a query evaluates or extracts a field.
- **Indexing**: Cannot be directly indexed using GIN (Generalized Inverted Index).

### 2. `JSONB` (Binary Storage)
- **Storage**: Stores data in a decomposed, highly optimized binary format.
- **Formatting**: Strips unnecessary whitespace, removes duplicate keys (keeping only the last value), and reorders keys for fast lookup.
- **Parsing Overhead**: Small overhead during `INSERT`/`UPDATE` due to conversion to binary, but **extremely fast** read access because no re-parsing is needed at query time.
- **Indexing**: Fully supports GIN indexing, allowing deep, arbitrary containment queries (`@>`).

---

## 📊 Comparison Matrix

| Feature | `JSON` | `JSONB` |
| :--- | :--- | :--- |
| **Storage Format** | Text string (exact input copy) | Decomposed binary format |
| **Key Ordering** | Preserved | Reordered for speed |
| **Duplicate Keys** | Retained | Discarded (last value wins) |
| **Whitespace** | Retained | Stripped |
| **Write Speed** | Slightly faster | Slight processing overhead |
| **Read Speed** | Slower (re-parsed per query) | **Significantly faster** |
| **Indexability** | Limited (Expression indexes only) | **Full GIN Indexing support** |

---

## 💻 SQL Code Snippets

```sql
-- Creating a table demonstrating JSON vs JSONB columns
CREATE TABLE user_profiles (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    raw_payload JSON,
    settings JSONB
);

-- Inserting data with duplicate keys and extra whitespace
INSERT INTO user_profiles (username, raw_payload, settings)
VALUES (
    'johndoe',
    '{"theme": "dark",   "theme": "light", "notifications": true}',
    '{"theme": "dark",   "theme": "light", "notifications": true}'
);

-- Querying the raw values to see the difference
SELECT 
    raw_payload AS json_exact_copy,
    settings AS jsonb_binary_cleaned
FROM user_profiles;
```

---

## 🏆 Best Practices

> [!TIP]
> **Default to `JSONB` for 99% of use cases.**  
> Only use the `JSON` data type if your application strictly requires preserving exact formatting, whitespace, key ordering, or duplicate keys (e.g., storing raw audit logs or exact digital signatures).

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Create custom sandbox tables storing JSONB configurations and benchmark execution plans.
- **`practice_dvdrental.sql`**: Simulate adding a JSONB `attributes` column to the rental or customer tables to store dynamic metadata.
