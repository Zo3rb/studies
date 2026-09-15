-- Practice training queries for the Introduction to EXPLAIN lesson
-- Using the dvdrental sample database

-- Show plan for a simple SELECT with a filter
EXPLAIN SELECT title, length FROM film WHERE length > 120;

-- Show actual execution details
EXPLAIN ANALYZE SELECT title, length FROM film WHERE length > 120;
