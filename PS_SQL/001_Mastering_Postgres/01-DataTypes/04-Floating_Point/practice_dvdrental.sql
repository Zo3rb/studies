-- ==========================================
-- PostgreSQL Floating-Point Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to explore float usage or runtime conversions.
-- ==========================================

-- 1. SEARCH FOR FLOATING-POINT COLUMNS IN DVDRENTAL
SELECT 
    table_name, 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND data_type IN ('real', 'double precision')
ORDER BY 
    table_name;
-- Note: You might find that the dvdrental schema designers did not use floating point types
-- because most numbers in this domain (costs, counts, durations) require exact types.


-- 2. CASTING AND COMPILING INEXACT VALUES FOR ANALYTICS
-- Sometimes in analytics or machine learning feature prep, we cast values to double precision.
SELECT 
    title,
    rental_rate,
    replacement_cost,
    
    -- Cast numeric columns to double precision for high-performance mathematical operations
    (rental_rate::double precision / replacement_cost::double precision) AS float_ratio,
    
    -- Using numeric type division for comparison
    (rental_rate / replacement_cost) AS numeric_ratio
FROM 
    film
LIMIT 10;
