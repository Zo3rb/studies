-- ==========================================
-- PostgreSQL Integers Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test integer ranges, sequences, and division.
-- ==========================================
-- 1. Create a table with all integer types
DROP TABLE IF EXISTS integer_practice;
CREATE TABLE integer_practice (
    user_id SERIAL PRIMARY KEY,
    age SMALLINT,
    page_views INT,
    api_calls BIGINT
);
-- 2. Insert valid values within limits
INSERT INTO integer_practice (age, page_views, api_calls)
VALUES (25, 150000, 9223372036854775),
    (99, 2147483640, 1000000000000);
SELECT *
FROM integer_practice;
-- 3. TEST OVERFLOW: Test boundaries
-- Run each query individually to see the database constraint messages:
-- SMALLINT Overflow (limit is 32767)
INSERT INTO integer_practice (age)
VALUES (32768);
-- ERROR: smallint out of range
-- INTEGER Overflow (limit is 2,147,483,647)
INSERT INTO integer_practice (page_views)
VALUES (2147483648);
-- ERROR: integer out of range
-- BIGINT Overflow (limit is 9,223,372,036,854,775,807)
INSERT INTO integer_practice (api_calls)
VALUES (9223372036854775808);
-- ERROR: bigint out of range
-- 4. INSPECT SEQUENCES CREATED BY SERIAL
-- Run this query to see information about the sequence generated for the user_id column
SELECT schemaname,
    sequencename,
    start_value,
    min_value,
    max_value,
    last_value
FROM pg_sequences;
-- 5. INTEGER DIVISION PRACTICE
-- Run this to observe SQL integer division behavior:
SELECT 10 / 3 AS integer_division,
    -- Returns 3 (truncated)
    10 / 3.0 AS numeric_division,
    -- Returns 3.3333333333333333 (exact)
    10::numeric / 3 AS cast_division_left,
    -- Returns 3.3333333333333333
    10 / 3::numeric AS cast_division_right;
-- Returns 3.3333333333333333