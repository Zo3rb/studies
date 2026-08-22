-- ========================================================
-- Topic: Exploring the Data
-- DATABASE: dvdrental
-- ========================================================

-- 1. Explore the actor table safely
SELECT * 
FROM actor 
LIMIT 5;

-- 2. Explore the film table, selecting only specific columns to save bandwidth
SELECT film_id, title, release_year, rating 
FROM film 
ORDER BY film_id 
LIMIT 10;

-- 3. Pagination Example: Get films 11-20
SELECT film_id, title 
FROM film 
ORDER BY film_id 
LIMIT 10 OFFSET 10;
