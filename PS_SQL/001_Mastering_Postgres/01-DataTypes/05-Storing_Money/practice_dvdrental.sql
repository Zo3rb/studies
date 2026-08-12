-- ==========================================
-- PostgreSQL Storing Money Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to study financial storage in a real-world project.
-- ==========================================

-- 1. CHECK IF THE NATIVE 'MONEY' TYPE IS USED IN DVDRENTAL
-- Query systems columns to see if 'money' was selected for any tables.
SELECT 
    table_name, 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND data_type = 'money';
-- Result: You should see no records. The database designers avoided the 'money' data type.


-- 2. INVESTIGATE THE PREFERRED CHOICE: NUMERIC
-- Let's query information about columns that store financial transactions in 'payment'.
SELECT 
    column_name, 
    data_type, 
    numeric_precision, 
    numeric_scale
FROM 
    information_schema.columns
WHERE 
    table_name = 'payment' 
    AND column_name = 'amount';
-- Result: 'amount' is NUMERIC(5,2).


-- 3. CALCULATE TRANSACTION TOTALS
-- Perform standard financial aggregations. Because it uses NUMERIC, operations are exact.
SELECT 
    customer_id,
    SUM(amount) AS total_spent,
    AVG(amount) AS avg_payment_amount,
    COUNT(payment_id) AS transaction_count
FROM 
    payment
GROUP BY 
    customer_id
ORDER BY 
    total_spent DESC
LIMIT 10;
