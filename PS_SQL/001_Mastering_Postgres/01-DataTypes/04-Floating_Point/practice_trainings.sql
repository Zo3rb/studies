-- ==========================================
-- PostgreSQL Floating-Point Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to understand float limitations and notation.
-- ==========================================
-- 1. Create a table with floating-point columns
DROP TABLE IF EXISTS float_sandbox;
CREATE TABLE float_sandbox (
    record_id SERIAL PRIMARY KEY,
    val_real REAL,
    val_double DOUBLE PRECISION
);
-- 2. Insert values, including scientific notation
INSERT INTO float_sandbox (val_real, val_double)
VALUES (12.3456, 12.3456789012345),
    (1.23e4, 4.56e -3);
-- 1.23e4 = 12300, 4.56e-3 = 0.00456
SELECT *
FROM float_sandbox;
-- 3. COMPARE PRECISION OF REAL VS DOUBLE PRECISION
-- real is 6 digits of precision, double precision is 15 digits.
-- Let's see what happens to a number with many significant digits:
INSERT INTO float_sandbox (val_real, val_double)
VALUES (1.23456789012345, 1.23456789012345);
SELECT record_id,
    val_real,
    -- Note how digits are truncated / rounded
    val_double
FROM float_sandbox
WHERE record_id = 3;
-- 4. DEMONSTRATE FLOATING-POINT MATHEMATICAL INACCURACY
-- Let's run a calculation directly to see how binary floating point rounding works.
SELECT (0.1::double precision + 0.2::double precision) AS float_sum,
    (0.1::numeric + 0.2::numeric) AS numeric_sum,
    -- In float math, this comparison evaluates to FALSE!
    (0.1::double precision + 0.2::double precision) = 0.3::double precision AS float_match,
    -- In numeric math, this comparison evaluates to TRUE!
    (0.1::numeric + 0.2::numeric) = 0.3::numeric AS numeric_match;