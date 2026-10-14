-- Lesson 02: Cross Joins
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

SELECT color, size FROM (VALUES ('red'), ('blue')) AS c(color) CROSS JOIN (VALUES ('S'), ('M'), ('L')) AS s(size) ORDER BY color, size;
