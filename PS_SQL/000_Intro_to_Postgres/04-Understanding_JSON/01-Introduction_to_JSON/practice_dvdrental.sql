-- ========================================================
-- Topic: Introduction to JSON
-- DATABASE: dvdrental
-- ========================================================

-- The dvdrental sample DB doesn't have native JSON columns, 
-- but we can cast row data to JSON to see how it looks!

SELECT row_to_json(actor) AS actor_json
FROM actor
LIMIT 5;

-- You can cast it directly to JSONB as well
SELECT CAST(row_to_json(customer) AS JSONB) AS customer_jsonb
FROM customer
LIMIT 5;

