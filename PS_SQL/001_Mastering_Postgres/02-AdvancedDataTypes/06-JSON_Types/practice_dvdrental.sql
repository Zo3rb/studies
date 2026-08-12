-- ==========================================
-- PostgreSQL JSON Types Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to construct dynamic JSON documents from relational tables.
-- ==========================================

-- 1. BUILD DYNAMIC JSON OBJECTS FOR CUSTOMER PROFILES
-- Combine customer name, address, and rental count into a single JSONB document:
SELECT 
    jsonb_build_object(
        'customer_id', c.customer_id,
        'full_name', c.first_name || ' ' || c.last_name,
        'email', c.email,
        'address', a.address,
        'city_id', a.city_id
    ) AS customer_json_payload
FROM 
    customer c
JOIN 
    address a ON c.address_id = a.address_id
LIMIT 10;


-- 2. AGGREGATE A ONE-TO-MANY RELATIONSHIP INTO A JSON ARRAY
-- Aggregate a customer's payment history into a nested JSONB array:
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    jsonb_agg(
        jsonb_build_object(
            'payment_id', p.payment_id,
            'amount', p.amount,
            'date', p.payment_date
        )
    ) AS payment_history_json
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, customer_name
LIMIT 5;
