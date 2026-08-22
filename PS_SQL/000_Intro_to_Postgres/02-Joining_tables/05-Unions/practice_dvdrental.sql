-- ========================================================
-- Topic: Unions
-- DATABASE: dvdrental
-- ========================================================

-- 1. Combine lists of actors and customers into a single mailing list
-- We add a hardcoded 'Type' column to distinguish them.
SELECT first_name, last_name, 'Actor' AS person_type
FROM actor
UNION ALL
SELECT first_name, last_name, 'Customer' AS person_type
FROM customer
ORDER BY last_name
LIMIT 20;

