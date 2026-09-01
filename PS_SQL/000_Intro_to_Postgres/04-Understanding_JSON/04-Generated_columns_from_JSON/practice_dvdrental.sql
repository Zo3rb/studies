-- ========================================================
-- Topic: Generated Columns from JSON
-- DATABASE: dvdrental
-- ========================================================

-- DVD rental does not have JSON columns to demonstrate this cleanly.
-- However, you can create Generated Columns from standard columns too!

-- Let's say we frequently want the customer's full name in uppercase.
-- ALTER TABLE customer 
-- ADD COLUMN full_name_upper VARCHAR(100) 
-- GENERATED ALWAYS AS (UPPER(first_name || ' ' || last_name)) STORED;

-- (Commented out to prevent mutating the sample database schema)

