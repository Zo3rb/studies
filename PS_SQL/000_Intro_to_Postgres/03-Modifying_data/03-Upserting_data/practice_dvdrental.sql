-- ========================================================
-- Topic: Upserting Data
-- DATABASE: dvdrental
-- ========================================================

-- The dvdrental database doesn't have many natural use cases for upserting 
-- since it represents historical transactions, but we can simulate it on a temp table.

CREATE TEMP TABLE customer_stats (
    customer_id INT UNIQUE,
    total_rentals INT
);

-- First run inserts the record
INSERT INTO customer_stats (customer_id, total_rentals) VALUES (1, 1)
ON CONFLICT (customer_id) DO UPDATE SET total_rentals = customer_stats.total_rentals + 1;

-- Second run updates the record!
INSERT INTO customer_stats (customer_id, total_rentals) VALUES (1, 1)
ON CONFLICT (customer_id) DO UPDATE SET total_rentals = customer_stats.total_rentals + 1;

SELECT * FROM customer_stats;

