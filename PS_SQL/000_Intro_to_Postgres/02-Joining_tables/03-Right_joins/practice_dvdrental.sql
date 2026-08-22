-- ========================================================
-- Topic: Right Joins
-- DATABASE: dvdrental
-- ========================================================

-- 1. Show all inventory items and their film titles using RIGHT JOIN
-- Generally, we would write this as film LEFT JOIN inventory.
SELECT f.title, i.inventory_id
FROM film f
RIGHT JOIN inventory i ON f.film_id = i.film_id
LIMIT 5;

