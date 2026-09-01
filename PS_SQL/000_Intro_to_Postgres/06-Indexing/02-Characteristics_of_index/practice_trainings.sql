-- ====================================================
-- Practice Trainings: Characteristics & Overhead of Indexes
-- ====================================================

-- 1. Create two test tables: one unindexed, one heavily indexed
DROP TABLE IF EXISTS bench_no_indexes;
DROP TABLE IF EXISTS bench_heavy_indexes;

CREATE TABLE bench_no_indexes (
    id INT,
    val1 TEXT,
    val2 INT,
    val3 TIMESTAMPTZ
);

CREATE TABLE bench_heavy_indexes (
    id INT,
    val1 TEXT,
    val2 INT,
    val3 TIMESTAMPTZ
);

CREATE INDEX idx_heavy_id ON bench_heavy_indexes (id);
CREATE INDEX idx_heavy_val1 ON bench_heavy_indexes (val1);
CREATE INDEX idx_heavy_val2 ON bench_heavy_indexes (val2);
CREATE INDEX idx_heavy_val3 ON bench_heavy_indexes (val3);

-- 2. Compare insertion time (Write Amplification test)
-- Insert 50,000 rows into unindexed table
EXPLAIN ANALYZE
INSERT INTO bench_no_indexes (id, val1, val2, val3)
SELECT i, 'text_' || i, i * 2, CURRENT_TIMESTAMP
FROM generate_series(1, 50000) i;

-- Insert 50,000 rows into heavily indexed table
EXPLAIN ANALYZE
INSERT INTO bench_heavy_indexes (id, val1, val2, val3)
SELECT i, 'text_' || i, i * 2, CURRENT_TIMESTAMP
FROM generate_series(1, 50000) i;

-- 3. Check storage footprint comparison
SELECT 
    'bench_no_indexes' AS table_name,
    pg_size_pretty(pg_relation_size('bench_no_indexes')) AS table_size,
    pg_size_pretty(pg_indexes_size('bench_no_indexes')) AS index_size
UNION ALL
SELECT 
    'bench_heavy_indexes' AS table_name,
    pg_size_pretty(pg_relation_size('bench_heavy_indexes')) AS table_size,
    pg_size_pretty(pg_indexes_size('bench_heavy_indexes')) AS index_size;
