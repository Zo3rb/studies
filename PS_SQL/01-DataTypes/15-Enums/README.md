# 🏷️ Lesson 15: ENUMs (Enumerated Types) in PostgreSQL

An **ENUM** (Enumerated) data type is a user-defined type that consists of a static, ordered set of text labels (such as order statuses, user roles, or priority levels).

---

## 1. Why Use ENUMs?

### **1. Data Integrity**
Prevents typos and invalid statuses from entering the database. Any insert or update containing a value not listed in the ENUM definition is rejected immediately.

### **2. Storage Efficiency**
Even though you write string labels like `'pending'` or `'processing'`, PostgreSQL stores ENUM values internally as **4-byte integers**. This saves significant disk space and RAM compared to repeating `VARCHAR` strings in millions of rows.

### **3. Built-In Ordering**
ENUM values have an inherent order determined by the sequence in which the labels were listed when creating the type:
```sql
CREATE TYPE priority_level AS ENUM ('low', 'medium', 'high', 'critical');
```
*   `'low' < 'medium' < 'high' < 'critical'`
*   You can run `WHERE priority > 'medium'` directly!

---

## 2. Managing ENUM Types

### **Create an ENUM Type:**
```sql
CREATE TYPE user_role AS ENUM ('admin', 'editor', 'viewer');
```

### **Use in a Table Definition:**
```sql
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    role user_role DEFAULT 'viewer'
);
```

### **Add a New Label to an Existing ENUM:**
```sql
ALTER TYPE user_role ADD VALUE 'moderator' AFTER 'editor';
```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to create ENUM types, test invalid value rejections, run comparisons (`>`), and add new labels.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to inspect the `mpaa_rating` ENUM type used in the `film` table.
