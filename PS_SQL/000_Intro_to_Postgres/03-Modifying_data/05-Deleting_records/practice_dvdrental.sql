-- ========================================================
-- Topic: Deleting Records
-- DATABASE: dvdrental
-- ========================================================

-- 1. Attempting to delete a customer will FAIL because of foreign keys 
-- (They have payments and rentals pointing to them).
-- DELETE FROM customer WHERE customer_id = 1; -- ERROR!

-- 2. Safely deleting from a table with no dependencies (using a dummy record)
INSERT INTO actor (first_name, last_name) VALUES ('DUMMY', 'ACTOR') RETURNING actor_id;

-- Now delete it
DELETE FROM actor WHERE first_name = 'DUMMY' AND last_name = 'ACTOR';

