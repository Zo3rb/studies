-- ========================================================
-- Topic: Aggregating Data
-- DATABASE: trainings
-- ========================================================

-- 1. Using the products table to find global metrics
SELECT 
    COUNT(*) AS total_products,
    SUM(stock_quantity) AS total_inventory_items,
    AVG(price) AS average_price,
    MAX(price) AS most_expensive
FROM products;

-- 2. Grouping by Category to see metrics per group
SELECT 
    category,
    COUNT(*) AS product_count,
    SUM(stock_quantity) AS category_stock
FROM products
GROUP BY category
ORDER BY product_count DESC;
