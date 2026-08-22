-- ========================================================
-- Topic: Orphaned Data
-- DATABASE: dvdrental
-- ========================================================

-- 1. Find films that are NOT in the inventory (Never stocked)
SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;

-- 2. Find customers who have NEVER made a payment
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL;

