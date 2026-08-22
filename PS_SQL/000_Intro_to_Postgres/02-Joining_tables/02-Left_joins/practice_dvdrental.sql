-- ========================================================
-- Topic: Left Joins
-- DATABASE: dvdrental
-- ========================================================

-- 1. Show all films and their inventory records. 
-- Films that are not in inventory will have NULL for inventory_id.
SELECT f.title, i.inventory_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
ORDER BY i.inventory_id ASC
LIMIT 10;

