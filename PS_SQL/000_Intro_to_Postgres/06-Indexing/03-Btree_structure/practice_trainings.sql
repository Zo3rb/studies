-- ====================================================
-- Practice Trainings: The B-Tree Index Structure
-- ====================================================

-- Enable pageinspect module (Postgres extension to inspect raw page bytes)
CREATE EXTENSION IF NOT EXISTS pageinspect;

-- 1. Create a sample table with indexed integer column
DROP TABLE IF EXISTS btree_demo;
CREATE TABLE btree_demo (
    id INT PRIMARY KEY,
    val TEXT
);

INSERT INTO btree_demo (id, val)
SELECT i, 'val_' || i FROM generate_series(1, 1000) i;

-- 2. Inspect the B-Tree index meta page
SELECT * FROM bt_metap('btree_demo_pkey');

-- 3. Inspect items in the root page (level 1 or 0)
SELECT * FROM bt_page_items('btree_demo_pkey', 1) LIMIT 10;
