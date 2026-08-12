-- ==========================================
-- PostgreSQL Schema Introduction Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to understand schemas, namespaces, and search paths.
-- ==========================================

-- 1. Check the current active schemas search path
SHOW search_path;


-- 2. Create two new schemas
CREATE SCHEMA IF NOT EXISTS sales;
CREATE SCHEMA IF NOT EXISTS inventory;


-- 3. Create tables with the SAME name in different schemas (Name Collision Resolution)
-- Note: Both are named 'products' but have different column schemas.
CREATE TABLE sales.products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price NUMERIC(10, 2)
);

CREATE TABLE inventory.products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    quantity_in_stock INT
);


-- 4. Insert data into both tables using fully qualified names (schema_name.table_name)
INSERT INTO sales.products (name, price) VALUES 
('Database Course Video', 49.99),
('Advanced SQL Guide Book', 19.99);

INSERT INTO inventory.products (name, quantity_in_stock) VALUES 
('Database Course Video', 1500),
('Advanced SQL Guide Book', 320);


-- 5. Query without qualifying the schema name
-- Which table does PostgreSQL query? Let's check:
SELECT * FROM products;
-- Result: You will likely get an ERROR: "relation 'products' does not exist" or it will look into 'public'
-- because 'sales' and 'inventory' are not in your default search_path.


-- 6. Update search path for the session
-- Set the search path to check 'sales' first, then 'inventory', then 'public'
SET search_path TO sales, inventory, public;

-- Verify the new search path
SHOW search_path;

-- Query the unqualified name again:
SELECT * FROM products;
-- Result: It will return the products from the 'sales' schema because 'sales' is first in search_path.


-- 7. Change search path preference
-- Set 'inventory' first
SET search_path TO inventory, sales, public;

-- Query again:
SELECT * FROM products;
-- Result: It now returns the products from the 'inventory' schema!


-- 8. Querying both tables explicitly
-- Even with a search path, you can always access any schema explicitly:
SELECT * FROM sales.products;
SELECT * FROM inventory.products;


-- 9. Clean up sandbox
-- Drop the schemas and everything inside them (CASCADE)
DROP SCHEMA IF EXISTS sales CASCADE;
DROP SCHEMA IF EXISTS inventory CASCADE;

-- Reset search path to default
RESET search_path;
SHOW search_path;
