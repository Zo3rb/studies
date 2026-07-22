-- ==========================================
-- PostgreSQL Chars & Collations Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test sorting differences under different collations.
-- ==========================================

-- 1. Create a table with text data
DROP TABLE IF EXISTS collation_demo;

CREATE TABLE collation_demo (
    id SERIAL PRIMARY KEY,
    word TEXT
);

-- 2. Insert mixed-case words
INSERT INTO collation_demo (word) VALUES 
('apple'),
('Apple'),
('banana'),
('Zebra'),
('zebra');

-- 3. TEST BINARY COLLATION ("C")
-- Under "C" collation, ASCII values rule: Uppercase (65-90) comes before Lowercase (97-122).
-- Expected order: Apple, Zebra, apple, banana, zebra
SELECT word FROM collation_demo ORDER BY word COLLATE "C";


-- 4. TEST DEFAULT LOCALE COLLATION
-- Language collation groups words alphabetically regardless of casing.
-- Expected order: Apple, apple, banana, Zebra, zebra
SELECT word FROM collation_demo ORDER BY word;


-- 5. LIST AVAILABLE SYSTEM COLLATIONS
SELECT collname, collencoding, collcollate 
FROM pg_collation 
WHERE collname IN ('C', 'POSIX', 'en_US', 'default')
LIMIT 10;
