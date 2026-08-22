-- ========================================================
-- Topic: Having
-- DATABASE: trainings
-- ========================================================

-- 1. Find categories that have more than 100 items in total stock
SELECT 
    category,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category
HAVING SUM(stock_quantity) > 100;

-- 2. Combining WHERE and HAVING
-- Filter out products cheaper than $50 before grouping, 
-- then only show categories with > 1 product remaining.
SELECT 
    category,
    COUNT(*) AS premium_products
FROM products
WHERE price >= 50.00
GROUP BY category
HAVING COUNT(*) > 1;
