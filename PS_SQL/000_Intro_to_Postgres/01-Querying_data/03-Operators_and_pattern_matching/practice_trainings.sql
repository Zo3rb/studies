-- ========================================================
-- Topic: Operators and Pattern Matching
-- DATABASE: trainings
-- ========================================================

-- 1. Using IN (Cleaner than OR)
SELECT product_name, category 
FROM products 
WHERE category IN ('Electronics', 'Furniture');

-- 2. Using BETWEEN (Inclusive range)
SELECT product_name, price 
FROM products 
WHERE price BETWEEN 50.00 AND 300.00;

-- 3. Pattern Matching with LIKE (Case-sensitive)
-- Find products starting with 'Lap'
SELECT product_name 
FROM products 
WHERE product_name LIKE 'Lap%';

-- 4. Pattern Matching with ILIKE (Case-insensitive)
SELECT product_name 
FROM products 
WHERE product_name ILIKE '%chair%';
