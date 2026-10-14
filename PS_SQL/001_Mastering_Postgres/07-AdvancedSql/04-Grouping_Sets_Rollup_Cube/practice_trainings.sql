-- Lesson 04: Grouping Sets, ROLLUP, and CUBE
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

WITH sales(region, product, amount) AS (VALUES ('north','tea',10), ('north','coffee',20), ('south','tea',7)) SELECT region, product, sum(amount), grouping(region, product) AS subtotal_mask FROM sales GROUP BY ROLLUP(region, product) ORDER BY region NULLS LAST, product NULLS LAST;
