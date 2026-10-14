-- Lesson 11: Row Value Syntax
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

SELECT (2, 'b') > (2, 'a') AS lexicographic_order, (1,2) IS NOT DISTINCT FROM (1,2) AS row_equal;
