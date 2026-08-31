-- ========================================================
-- Topic: Updating Data
-- DATABASE: dvdrental
-- ========================================================

-- 1. Let's pretend we want to make all of 'MARY SMITH's rentals free.
-- First, verify what we are going to update (Best Practice!)
SELECT * FROM payment 
WHERE customer_id = 1 AND amount > 0;

-- 2. Execute the update
UPDATE payment
SET amount = 0.00
WHERE customer_id = 1 AND amount > 0;

-- (Note: In a real environment, you wouldn't do this to the DVD rental DB, 
-- but this shows the syntax!)

