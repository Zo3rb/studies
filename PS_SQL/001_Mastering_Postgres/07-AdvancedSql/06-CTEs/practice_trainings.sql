-- Lesson 06: Common Table Expressions (CTEs)
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

WITH numbers AS (SELECT generate_series(1,5) AS n), doubled AS (SELECT n, n * 2 AS value FROM numbers) SELECT * FROM doubled WHERE value > 4 ORDER BY n;
