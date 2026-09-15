-- Sample practice queries for the Introduction to EXPLAIN lesson
-- Demonstrate basic EXPLAIN usage on the dvdrental sample database

-- Show the plan without execution
EXPLAIN SELECT * FROM film WHERE rating = 'PG';

-- Show the plan with ANALYZE to get actual timings
EXPLAIN ANALYZE SELECT * FROM film WHERE rating = 'PG';
