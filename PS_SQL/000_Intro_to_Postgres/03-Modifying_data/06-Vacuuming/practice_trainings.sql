-- ========================================================
-- Topic: Vacuuming
-- DATABASE: trainings
-- ========================================================

-- 1. Setup a table and generate dead tuples
CREATE TABLE metrics (id INT PRIMARY KEY, value INT);
INSERT INTO metrics VALUES (1, 100);

-- Every update creates a dead tuple of the previous state!
UPDATE metrics SET value = 200 WHERE id = 1;
UPDATE metrics SET value = 300 WHERE id = 1;
UPDATE metrics SET value = 400 WHERE id = 1;

-- 2. Run a standard manual VACUUM to mark the space of the dead tuples as reusable
-- (Does not lock the table)
VACUUM metrics;

-- 3. Run VACUUM ANALYZE to also update table statistics for the query planner
VACUUM ANALYZE metrics;

