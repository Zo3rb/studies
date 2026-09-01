-- ====================================================
-- Practice DVD Rental: Reading EXPLAIN Plans
-- ====================================================

-- 1. Profile complex multi-table JOIN in dvdrental with BUFFERS
EXPLAIN (ANALYZE, BUFFERS)
SELECT 
    c.first_name,
    c.last_name,
    f.title,
    r.rental_date
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE c.customer_id = 25
ORDER BY r.rental_date DESC;

-- 2. Analyze Aggregation and HAVING clause execution plan
EXPLAIN (ANALYZE, BUFFERS)
SELECT 
    customer_id,
    COUNT(*) AS total_rentals,
    SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150
ORDER BY total_spent DESC;
