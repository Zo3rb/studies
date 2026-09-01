-- ====================================================
-- Practice DVD Rental: The B-Tree Index Structure
-- ====================================================

-- 1. Test range scan on rental_date using B-Tree index
EXPLAIN ANALYZE
SELECT rental_id, rental_date, customer_id
FROM rental
WHERE rental_date BETWEEN '2005-05-24' AND '2005-05-26'
ORDER BY rental_date;

-- 2. Test prefix match on customer last_name using B-Tree
EXPLAIN ANALYZE
SELECT customer_id, first_name, last_name
FROM customer
WHERE last_name LIKE 'SM%';
