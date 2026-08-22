-- ========================================================
-- Topic: Having
-- DATABASE: dvdrental
-- ========================================================

-- 1. Find customers who have spent more than $150 in total
SELECT 
    customer_id,
    SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150.00
ORDER BY total_spent DESC;

-- 2. Find customers who have rented more than 30 times
SELECT 
    customer_id,
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) > 30
ORDER BY total_rentals DESC;
