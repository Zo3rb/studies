-- ====================================================
-- Practice Trainings: Reading EXPLAIN Plans
-- ====================================================

-- 1. Create benchmark table
DROP TABLE IF EXISTS explain_test;
CREATE TABLE explain_test (
    id INT PRIMARY KEY,
    category INT,
    payload TEXT
);

INSERT INTO explain_test (id, category, payload)
SELECT i, (i % 50), 'payload_data_' || i
FROM generate_series(1, 20000) i;

-- 2. Simple EXPLAIN (Estimates only)
EXPLAIN 
SELECT * FROM explain_test WHERE category = 10;

-- 3. EXPLAIN (ANALYZE, BUFFERS) - Executes and measures I/O buffers
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM explain_test WHERE category = 10;

-- 4. Stale statistics demo: Update statistics using ANALYZE
ANALYZE explain_test;

EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM explain_test WHERE id = 1050;
