-- ==========================================
-- PostgreSQL NaNs and Infinity Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test sorting and math behaviors of special numbers.
-- ==========================================

-- 1. Create a table for testing special values
DROP TABLE IF EXISTS special_numbers;

CREATE TABLE special_numbers (
    id SERIAL PRIMARY KEY,
    description VARCHAR(50),
    num_val DOUBLE PRECISION
);

-- 2. Insert standard and special values
INSERT INTO special_numbers (description, num_val) VALUES 
('Negative Ten', -10.0),
('Zero', 0.0),
('Positive Fifty', 50.0),
('Positive Infinity', 'Infinity'),
('Negative Infinity', '-Infinity'),
('Not a Number', 'NaN');

-- 3. TEST THE SORTING ORDER (Ascending)
-- Expected order: -Infinity, -10.0, 0.0, 50.0, Infinity, NaN
SELECT * FROM special_numbers ORDER BY num_val ASC;

-- 4. TEST THE SORTING ORDER (Descending)
-- Expected order: NaN, Infinity, 50.0, 0.0, -10.0, -Infinity
SELECT * FROM special_numbers ORDER BY num_val DESC;


-- 5. TEST ARITHMETIC WITH SPECIAL VALUES
SELECT 
    'Infinity'::double precision + 500 AS infinity_plus,
    '-Infinity'::double precision * 2 AS neg_infinity_times,
    'Infinity'::double precision - 'Infinity'::double precision AS infinity_minus_itself,
    'NaN'::double precision + 10 AS nan_plus;


-- 6. CHECK FOR NaN VALUE IN WHERE CLAUSE
-- Note: In standard SQL, you cannot use "= NaN" because NaN is not equal to anything (even itself).
-- Instead, use:
SELECT * FROM special_numbers WHERE num_val = 'NaN'::double precision; -- Works in PostgreSQL
-- Or:
SELECT 'NaN'::double precision = 'NaN'::double precision AS nan_equals_nan;
