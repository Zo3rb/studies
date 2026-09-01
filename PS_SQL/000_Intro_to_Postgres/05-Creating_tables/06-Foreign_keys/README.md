# Lesson 06: Foreign Keys & Referential Integrity

## 📖 Overview
Foreign Keys enforce relationships between tables, ensuring that a child row cannot reference a non-existent parent row. They also control cascading actions when parent records are updated or deleted.

---

## 🧠 Key Concepts & Referential Actions

### Foreign Key Actions on `DELETE` / `UPDATE`

| Action | Behavior |
| :--- | :--- |
| `NO ACTION` (Default) | Produces an error if the parent row is deleted while child rows reference it (evaluated at end of transaction). |
| `RESTRICT` | Produces an immediate error if child records exist (evaluated immediately). |
| `CASCADE` | Automatically deletes or updates referencing rows in the child table when parent is deleted/updated. |
| `SET NULL` | Sets foreign key column in child table to `NULL` when parent row is deleted. |
| `SET DEFAULT` | Sets foreign key column in child table to its `DEFAULT` value when parent row is deleted. |

---

## 💻 SQL Examples & Crucial Indexing Rule

```sql
CREATE TABLE categories (
    category_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE products (
    product_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INT NOT NULL,
    
    -- Defining foreign key with CASCADE action
    CONSTRAINT fk_products_category 
        FOREIGN KEY (category_id) 
        REFERENCES categories(category_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- CRITICAL PERFORMANCE BEST PRACTICE:
-- Always build a B-Tree index on foreign key columns in child tables!
CREATE INDEX idx_products_category_id ON products(category_id);
```

> [!WARNING]
> **PostgreSQL does NOT automatically index foreign key columns in child tables!**  
> If you delete a parent record, Postgres must perform a full table scan on un-indexed child tables to check for referencing rows. Always add indexes to child foreign key columns.

---

## 🏆 Best Practices

- **Use `CASCADE` Intelligently**: Use `ON DELETE CASCADE` for tight parent-child ownership (e.g. `order_items` belonging to `orders`). Avoid it for reference entities (e.g., deleting a `country` should not silently delete all `users`!).
- **Index Foreign Keys**: Always index foreign key columns to ensure fast join operations and efficient referential checks.

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Build e-commerce schemas establishing foreign keys between orders, order items, products, and customers.
- **`practice_dvdrental.sql`**: Explore foreign key constraints linking `rental` -> `customer`, `rental` -> `inventory`, and `film_actor` -> `film`.
