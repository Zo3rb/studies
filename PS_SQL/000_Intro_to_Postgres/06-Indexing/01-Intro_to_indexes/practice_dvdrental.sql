-- ====================================================
-- Practice DVD Rental: Introduction to Database Indexes
-- ====================================================

-- 1. Explore existing indexes on dvdrental tables
SELECT 
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename IN ('customer', 'film', 'rental', 'payment')
ORDER BY tablename, indexname;

-- 2. Observe index usage on rental table for customer_id lookup
EXPLAIN ANALYZE
SELECT * FROM rental WHERE customer_id = 148;

-- 3. Observe index usage on payment table for amount lookup (no index on amount by default)
EXPLAIN ANALYZE
SELECT * FROM payment WHERE amount > 10.99;
