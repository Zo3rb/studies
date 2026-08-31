-- ========================================================
-- Topic: Inserting Data
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    in_stock BOOLEAN DEFAULT true
);

-- 2. Single row insert
INSERT INTO products (name, price) 
VALUES ('Mechanical Keyboard', 120.50);

-- 3. Multi-row bulk insert (Best Practice for performance)
INSERT INTO products (name, price, in_stock) 
VALUES 
('Wireless Mouse', 45.00, true),
('Monitor Stand', 35.00, false),
('USB-C Hub', 25.99, true);

-- 4. Verify insertion
SELECT * FROM products;

