-- Practice queries for Cost & Rows lesson
-- Show cost and row estimate for a simple SELECT
EXPLAIN SELECT * FROM film WHERE length > 100;

-- Show actual execution with ANALYZE
EXPLAIN ANALYZE SELECT * FROM film WHERE length > 100;
