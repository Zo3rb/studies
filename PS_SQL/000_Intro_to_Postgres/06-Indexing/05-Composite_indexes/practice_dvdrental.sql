-- ====================================================
-- Practice DVD Rental: Composite Indexes
-- ====================================================

-- 1. Multi-column query on payment table
EXPLAIN ANALYZE
SELECT customer_id, staff_id, amount, payment_date
FROM payment
WHERE customer_id = 200 AND staff_id = 2;

-- 2. Build composite index on customer_id + staff_id
CREATE INDEX idx_payment_cust_staff ON payment (customer_id, staff_id);

-- 3. Check performance improvement
EXPLAIN ANALYZE
SELECT customer_id, staff_id, amount, payment_date
FROM payment
WHERE customer_id = 200 AND staff_id = 2;

-- Clean up
DROP INDEX idx_payment_cust_staff;
