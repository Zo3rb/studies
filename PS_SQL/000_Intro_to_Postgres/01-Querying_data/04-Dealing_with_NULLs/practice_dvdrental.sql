-- ========================================================
-- Topic: Dealing with NULLs
-- DATABASE: dvdrental
-- ========================================================

-- 1. Find rentals that have not been returned yet (return_date is NULL)
SELECT rental_id, rental_date, customer_id 
FROM rental 
WHERE return_date IS NULL;

-- 2. Find rentals that HAVE been returned
SELECT rental_id, rental_date, return_date 
FROM rental 
WHERE return_date IS NOT NULL
LIMIT 5;

-- 3. Using COALESCE to replace NULL with a default string
-- Note: Cast return_date to text so it matches the 'Not Returned' string type
SELECT 
    rental_id, 
    COALESCE(return_date::text, 'Not Returned Yet') AS status 
FROM rental 
LIMIT 10;
