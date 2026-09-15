-- Practice queries for Cost & Rows lesson (training version)
-- Show actual timings with ANALYZE for a query with estimated cost
EXPLAIN ANALYZE SELECT * FROM film WHERE length > 100;

-- Show how planner estimates rows vs actual rows for a join
EXPLAIN ANALYZE SELECT f.title, a.actor_id FROM film f
JOIN film_actor a ON f.film_id = a.film_id WHERE a.actor_id = 1;
