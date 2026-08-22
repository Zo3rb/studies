-- ========================================================
-- Topic: Filtering
-- DATABASE: trainings
-- ========================================================

-- 1. Using the products table from Lesson 1
-- Find all electronics
SELECT product_name, price 
FROM products 
WHERE category = 'Electronics';

-- 2. Combining conditions with AND
SELECT product_name, price 
FROM products 
WHERE category = 'Electronics' AND price < 1000;

-- 3. Combining conditions with OR and parentheses (Best Practice)
SELECT product_name, category, price 
FROM products 
WHERE (category = 'Furniture' OR category = 'Kitchen') 
  AND price < 100;
