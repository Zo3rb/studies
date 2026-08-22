-- ========================================================
-- Topic: Filtering
-- DATABASE: dvdrental
-- ========================================================

-- 1. Find all customers who are currently active (active = 1)
SELECT first_name, last_name, email 
FROM customer 
WHERE active = 1;

-- 2. Find films that are rated 'R' and have a rental rate under $3.00
SELECT title, rating, rental_rate 
FROM film 
WHERE rating = 'R' AND rental_rate < 3.00;

-- 3. Using Parentheses for complex logic
-- Find 'PG' or 'PG-13' films that run for more than 2 hours (120 mins)
SELECT title, rating, length 
FROM film 
WHERE (rating = 'PG' OR rating = 'PG-13') 
  AND length > 120;
