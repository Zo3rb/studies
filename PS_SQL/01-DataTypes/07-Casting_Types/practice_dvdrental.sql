-- ==========================================
-- PostgreSQL Casting Types Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query and cast real-world datasets.
-- ==========================================

-- 1. GROUP BY DATE (CASTING TIMESTAMP TO DATE)
-- Column 'payment_date' is stored as TIMESTAMP WITH TIME ZONE.
-- To analyze daily totals, we must cast it to a standard DATE.
SELECT 
    payment_date::date AS transaction_date,
    COUNT(payment_id) AS total_transactions,
    SUM(amount) AS daily_revenue
FROM 
    payment
GROUP BY 
    payment_date::date
ORDER BY 
    transaction_date;


-- 2. CASTING INTEGERS TO TEXT FOR CONCATENATION
-- Suppose you want to combine customer_id (integer) and names into a label format.
-- If you concatenate integers directly, PostgreSQL handles it, but explicit casting is safer:
SELECT 
    customer_id,
    first_name || ' ' || last_name || ' (ID: ' || customer_id::text || ')' AS customer_profile_label
FROM 
    customer
LIMIT 10;
