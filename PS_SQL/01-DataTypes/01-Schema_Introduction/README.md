# 🏗️ Lesson 1: Introduction to Schema

In PostgreSQL, a **schema** is a namespace that contains named database objects, such as tables, views, indexes, data types, functions, and operators. It is a logical partition inside a database.

---

## 1. What is a Schema?
Think of a database as a file system:
*   The **Database** is like a hard drive partition (e.g., `C:`).
*   A **Schema** is like a directory/folder under that partition.
*   **Tables, views, etc.** are files inside that folder.

A single database can contain multiple schemas, and objects in different schemas can share the same name without collision (e.g., `sales.customers` and `support.customers`).

---

## 2. The `public` Schema
By default, every new PostgreSQL database contains a schema named **`public`**. 
*   If you create a table without specifying a schema name, it is automatically placed in the `public` schema:
    ```sql
    CREATE TABLE users (...); -- Created in public.users
    ```
*   Similarly, querying `SELECT * FROM users;` searches the default schema path.

---

## 3. The `search_path`
How does PostgreSQL resolve a table name like `users` when you don't supply a schema? It looks at the **`search_path`** parameter.
*   `search_path` is a comma-separated list of schemas that PostgreSQL checks in order.
*   To check your current search path:
    ```sql
    SHOW search_path;
    ```
    Typically, this returns: `"$user", public`. This means PostgreSQL first looks for a schema with the same name as the logged-in user, and if not found, checks the `public` schema.

---

## 4. Managing Schemas
You can create, alter, and delete schemas using standard DDL:

*   **Create a schema:**
    ```sql
    CREATE SCHEMA sales;
    ```
*   **Create a table within a schema:**
    ```sql
    CREATE TABLE sales.orders (
        order_id SERIAL PRIMARY KEY,
        amount NUMERIC(10, 2)
    );
    ```
*   **Change search path for the current session:**
    ```sql
    SET search_path TO sales, public;
    ```
*   **Drop a schema (and all its contents recursively):**
    ```sql
    DROP SCHEMA sales CASCADE;
    ```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute the queries in [practice_trainings.sql](./practice_trainings.sql). This will teach you how to create schemas, manage the `search_path`, resolve table name collisions, and inspect the catalog.
3. In the **`dvdrental`** database, execute the queries in [practice_dvdrental.sql](./practice_dvdrental.sql) to inspect the existing schemas and how tables are structured.
