-- Lesson 03: Grouping
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

WITH sales(region, amount) AS (VALUES ('north',10), ('north',15), ('south',8)) SELECT region, count(*) AS orders, sum(amount) AS revenue FROM sales GROUP BY region HAVING sum(amount) > 10 ORDER BY region;
