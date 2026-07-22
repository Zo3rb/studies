-- ==========================================
-- PostgreSQL Timestamps & Dates Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query temporal data and build time-series aggregations.
-- ==========================================

-- 1. INSPECT TEMPORAL COLUMNS IN DVDRENTAL
SELECT 
    table_name, 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND data_type IN ('timestamp with time zone', 'timestamp without time zone', 'date', 'time without time zone')
ORDER BY 
    data_type, table_name;


-- 2. MONTHLY REVENUE TIME-SERIES REPORT USING DATE_TRUNC()
-- Group all payments by month to observe revenue trends:
SELECT 
    DATE_TRUNC('month', payment_date) AS payment_month,
    COUNT(payment_id) AS total_rentals,
    SUM(amount) AS total_revenue
FROM 
    payment
GROUP BY 
    DATE_TRUNC('month', payment_date)
ORDER BY 
    payment_month;


-- 3. PEAK RENTAL HOURS REPORT USING EXTRACT()
-- Analyze what hour of the day customers rent the most movies:
SELECT 
    EXTRACT(HOUR FROM rental_date) AS rental_hour,
    COUNT(rental_id) AS total_rentals
FROM 
    rental
GROUP BY 
    EXTRACT(HOUR FROM rental_date)
ORDER BY 
    rental_hour;
