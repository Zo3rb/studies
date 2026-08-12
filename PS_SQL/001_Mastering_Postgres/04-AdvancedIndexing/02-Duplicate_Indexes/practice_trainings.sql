-- ========================================================
-- Topic: Duplicate Indexes
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE demo_02_duplicate_indexes (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    val1 VARCHAR(100),
    val2 INT
);

-- 2. Insert dummy data
INSERT INTO demo_02_duplicate_indexes (val1, val2)
SELECT 'test' || g, g % 100
FROM generate_series(1, 10000) AS g;

-- 3. Run queries to test Duplicate Indexes concepts
EXPLAIN ANALYZE SELECT * FROM demo_02_duplicate_indexes WHERE val2 = 50;

-- 4. Cleanup
DROP TABLE demo_02_duplicate_indexes;
