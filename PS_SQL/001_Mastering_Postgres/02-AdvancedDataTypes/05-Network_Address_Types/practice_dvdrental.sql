-- ==========================================
-- PostgreSQL Network Address Types Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query network address functions on customer data.
-- ==========================================

-- 1. SYNTHESIZE IP LOGINS FOR CUSTOMERS AND FILTER BY SUBNET
WITH customer_logins AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        ('192.168.' || (customer_id % 5) || '.' || (customer_id % 250))::inet AS login_ip
    FROM 
        customer
)
SELECT 
    customer_id,
    first_name,
    last_name,
    login_ip,
    host(login_ip) AS clean_ip
FROM 
    customer_logins
WHERE 
    login_ip << '192.168.1.0/24'::cidr
LIMIT 15;
