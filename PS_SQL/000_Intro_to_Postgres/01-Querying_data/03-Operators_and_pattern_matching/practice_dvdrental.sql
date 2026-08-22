-- ========================================================
-- Topic: Operators and Pattern Matching
-- DATABASE: dvdrental
-- ========================================================

-- 1. Find actors whose first name starts with 'A'
SELECT first_name, last_name 
FROM actor 
WHERE first_name LIKE 'A%';

-- 2. Find films with 'Boat' anywhere in the title (Case-insensitive)
SELECT title, description 
FROM film 
WHERE title ILIKE '%boat%';

-- 3. Find payments between $5.00 and $10.00
SELECT payment_id, amount, payment_date 
FROM payment 
WHERE amount BETWEEN 5.00 AND 10.00;

-- 4. Using IN to find specific customer IDs
SELECT customer_id, first_name, last_name 
FROM customer 
WHERE customer_id IN (1, 5, 10, 15);
