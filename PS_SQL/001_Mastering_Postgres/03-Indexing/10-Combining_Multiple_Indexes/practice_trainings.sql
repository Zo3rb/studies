-- ========================================================
-- Topic: Combining Multiple Indexes
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE demo_10_combining_multiple_indexes (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    val1 VARCHAR(100),
    val2 INT
);

-- 2. Insert dummy data
INSERT INTO demo_10_combining_multiple_indexes (val1, val2)
SELECT 'test' || g, g % 100
FROM generate_series(1, 10000) AS g;

-- 3. Run queries to test Combining Multiple Indexes concepts
EXPLAIN ANALYZE SELECT * FROM demo_10_combining_multiple_indexes WHERE val2 = 50;

-- 4. Cleanup
DROP TABLE demo_10_combining_multiple_indexes;
