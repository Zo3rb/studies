-- ========================================================
-- Topic: B-Tree Overview
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE demo_03_b_tree_overview (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    val1 VARCHAR(100),
    val2 INT
);

-- 2. Insert dummy data
INSERT INTO demo_03_b_tree_overview (val1, val2)
SELECT 'test' || g, g % 100
FROM generate_series(1, 10000) AS g;

-- 3. Run queries to test B-Tree Overview concepts
EXPLAIN ANALYZE SELECT * FROM demo_03_b_tree_overview WHERE val2 = 50;

-- 4. Cleanup
DROP TABLE demo_03_b_tree_overview;
