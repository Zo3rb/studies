-- ========================================================
-- LESSON 01: Introduction to Indexes
-- DATABASE: dvdrental
-- ========================================================

-- 1. Let's see the existing indexes on the 'customer' table.
-- The dvdrental database already comes with some indexes.
SELECT 
    indexname, 
    indexdef 
FROM pg_indexes 
WHERE tablename = 'customer';

-- 2. Run a query to find a customer by their email.
-- Since email usually isn't indexed by default in this sample DB (unless modified),
-- this might result in a Sequential Scan.
EXPLAIN ANALYZE 
SELECT * 
FROM customer 
WHERE email = 'MARY.SMITH@sakilacustomer.org';

-- 3. Let's add an index to speed up email lookups!
CREATE INDEX idx_customer_email ON customer(email);

-- 4. Re-run the query and observe the performance change in EXPLAIN ANALYZE.
EXPLAIN ANALYZE 
SELECT * 
FROM customer 
WHERE email = 'MARY.SMITH@sakilacustomer.org';

-- 5. Drop the index after testing to keep the database in its original state
DROP INDEX idx_customer_email;
