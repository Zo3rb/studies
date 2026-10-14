-- Lesson 05: Window Functions
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

WITH scores(name, points) AS (VALUES ('A',8), ('B',12), ('C',12)) SELECT name, points, rank() OVER (ORDER BY points DESC) AS place, sum(points) OVER (ORDER BY name ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total FROM scores ORDER BY name;
