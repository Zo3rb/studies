-- ====================================================
-- Practice DVD Rental: Where to Add an Index
-- ====================================================

-- 1. Unindexed lookup on payment amount
EXPLAIN ANALYZE
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount = 11.99;

-- 2. Create index on payment amount to speed up specific filter queries
CREATE INDEX idx_payment_amount ON payment (amount);

-- 3. Verify execution plan now uses Index Scan
EXPLAIN ANALYZE
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount = 11.99;

-- Clean up benchmark index
DROP INDEX idx_payment_amount;
