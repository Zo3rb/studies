-- ==========================================
-- PostgreSQL Intervals Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test interval arithmetic, AGE(), and precision.
-- ==========================================

-- 1. Create a table with interval columns
DROP TABLE IF EXISTS subscriptions;

CREATE TABLE subscriptions (
    sub_id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL,
    start_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    duration INTERVAL NOT NULL
);

-- 2. Insert rows using different interval syntax
INSERT INTO subscriptions (user_name, duration) VALUES 
('Alice', INTERVAL '1 month'),
('Bob', INTERVAL '14 days 6 hours'),
('Charlie', INTERVAL 'P1Y2M3D'); -- ISO 8601

SELECT 
    user_name,
    start_date,
    duration,
    start_date + duration AS expiration_date
FROM 
    subscriptions;


-- 3. TEST AGE() FUNCTION
SELECT 
    AGE('2026-12-31'::date, '2026-01-01'::date) AS year_span,
    AGE(CURRENT_TIMESTAMP, '2000-01-01 00:00:00'::timestamp) AS age_since_y2k;


-- 4. EXTRACTING FIELDS FROM INTERVAL
SELECT 
    EXTRACT(DAY FROM INTERVAL '5 days 12 hours') AS days_part,
    EXTRACT(HOUR FROM INTERVAL '5 days 12 hours') AS hours_part;
