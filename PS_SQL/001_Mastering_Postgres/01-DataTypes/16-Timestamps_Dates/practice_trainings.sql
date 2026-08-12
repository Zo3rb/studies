-- ==========================================
-- PostgreSQL Timestamps & Dates Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test TIMESTAMPTZ session conversions and INTERVAL math.
-- ==========================================

-- 1. Create a table with temporal columns
DROP TABLE IF EXISTS event_logs;

CREATE TABLE event_logs (
    event_id SERIAL PRIMARY KEY,
    event_name TEXT NOT NULL,
    created_at_tz TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    created_at_notz TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    event_date DATE DEFAULT CURRENT_DATE
);

-- 2. Insert test event
INSERT INTO event_logs (event_name) VALUES ('System Audit Check');

SELECT * FROM event_logs;


-- 3. TEST SESSION TIMEZONE CONVERSIONS ON TIMESTAMPTZ
-- Check current session timezone
SHOW TimeZone;

-- Change session timezone to UTC and query the event log
SET TimeZone TO 'UTC';
SELECT event_name, created_at_tz, created_at_notz FROM event_logs;

-- Change session timezone to 'Asia/Tokyo' (+9) and query again
SET TimeZone TO 'Asia/Tokyo';
SELECT event_name, created_at_tz, created_at_notz FROM event_logs;
-- Notice how created_at_tz automatically shifts to Tokyo local time, while created_at_notz remains unchanged!

-- Reset timezone back to default
RESET TimeZone;


-- 4. INTERVAL ARITHMETIC
SELECT 
    NOW() AS current_time,
    NOW() + INTERVAL '1 month' AS one_month_later,
    NOW() - INTERVAL '3 hours 30 minutes' AS earlier_today,
    '2026-12-31'::date - CURRENT_DATE AS days_left_in_year;


-- 5. EXTRACT AND DATE_TRUNC DEMO
SELECT 
    NOW() AS current_time,
    EXTRACT(YEAR FROM NOW()) AS current_year,
    EXTRACT(DOW FROM NOW()) AS day_of_week, -- 0 = Sunday, 6 = Saturday
    DATE_TRUNC('month', NOW()) AS start_of_current_month,
    DATE_TRUNC('day', NOW()) AS start_of_today;
