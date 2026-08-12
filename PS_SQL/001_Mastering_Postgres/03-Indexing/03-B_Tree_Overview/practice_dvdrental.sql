-- ========================================================
-- Topic: B-Tree Overview
-- DATABASE: dvdrental
-- ========================================================

-- Analyze index usage related to B-Tree Overview in the dvdrental DB.
-- For example, check existing indexes on popular tables:
SELECT indexname, indexdef 
FROM pg_indexes 
WHERE tablename IN ('customer', 'rental', 'payment');

-- Query using an existing column
EXPLAIN ANALYZE 
SELECT * FROM payment WHERE amount > 5.00;
