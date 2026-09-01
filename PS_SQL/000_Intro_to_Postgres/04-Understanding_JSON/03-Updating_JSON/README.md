# Lesson 03: Updating JSONB Documents

## 📖 Overview
PostgreSQL allows you to modify JSONB documents in place without requiring your application to fetch the entire document, parse it, update the field in code, and write the full document back to the database.

---

## 🧠 Key Functions & Operators

### 1. `jsonb_set()` Function
Replaces an existing value or inserts a new key/value pair at a specified path.
```sql
jsonb_set(target jsonb, path text[], new_value jsonb [, create_if_missing boolean])
```

### 2. `jsonb_insert()` Function
Inserts a new value into a JSONB array or object without replacing existing values.
```sql
jsonb_insert(target jsonb, path text[], new_value jsonb [, insert_after boolean])
```

### 3. Concatenation Operator (`||`)
Merges two JSONB objects or appends elements to a JSONB array.

### 4. Deletion Operators (`-` and `#-`)
- `jsonb - text`: Deletes a top-level key from a JSONB object.
- `jsonb - integer`: Deletes an array element by index.
- `jsonb #- text[]`: Deletes an element at a nested path.

---

## 💻 SQL Code Examples

```sql
-- 1. Updating a nested field using jsonb_set
UPDATE user_profiles
SET settings = jsonb_set(settings, '{theme}', '"dark"'::jsonb)
WHERE username = 'johndoe';

-- 2. Adding a new nested key (create_if_missing defaults to TRUE)
UPDATE user_profiles
SET settings = jsonb_set(settings, '{notifications, email}', 'true'::jsonb, true)
WHERE username = 'johndoe';

-- 3. Merging new key-value pairs using the || operator
UPDATE user_profiles
SET settings = settings || '{"language": "en", "timezone": "UTC"}'::jsonb
WHERE username = 'johndoe';

-- 4. Removing a top-level key using - operator
UPDATE user_profiles
SET settings = settings - 'notifications'
WHERE username = 'johndoe';

-- 5. Removing a nested element by path using #- operator
UPDATE user_profiles
SET settings = settings #- '{user, preferences, beta_features}'
WHERE username = 'johndoe';
```

---

## 🏆 Best Practices

- **Ensure Atomic Updates**: In-place JSONB updates in SQL eliminate race conditions common when applications read-modify-write JSON documents concurrently.
- **Cast Values Properly**: Remember that the `new_value` argument in `jsonb_set` must be valid `JSONB` (e.g. `'true'::jsonb`, `'"dark"'::jsonb`, or `'100'::jsonb`).

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Write update statements to toggle feature flags and append activity logs inside JSONB fields.
- **`practice_dvdrental.sql`**: Practice updating customer address metadata stored inside a simulated JSONB column.
