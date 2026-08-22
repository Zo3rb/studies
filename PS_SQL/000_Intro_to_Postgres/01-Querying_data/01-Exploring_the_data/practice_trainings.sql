-- ========================================================
-- Topic: Exploring the Data
-- DATABASE: trainings
-- ========================================================

-- 1. Create a sample table for products
CREATE TABLE IF NOT EXISTS products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10, 2),
    stock_quantity INT
);

-- 2. Insert sample data
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop Pro', 'Electronics', 1200.00, 50),
('Mechanical Keyboard', 'Electronics', 150.00, 200),
('Coffee Mug', 'Kitchen', 15.00, 500),
('Ergonomic Chair', 'Furniture', 300.00, 20),
('Desk Lamp', 'Furniture', 45.00, 150);

-- 3. The danger of SELECT * (Always use LIMIT when exploring!)
SELECT * FROM products LIMIT 2;

-- 4. Selecting explicit columns (Best Practice)
SELECT product_name, price FROM products LIMIT 3;

-- 5. Using OFFSET for pagination (e.g., getting the 2nd page of results)
-- Always use ORDER BY when paginating!
SELECT product_name, price 
FROM products 
ORDER BY product_id
LIMIT 2 OFFSET 2;
