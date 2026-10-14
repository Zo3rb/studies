-- Lesson 13: Materialized Views
-- Target database: trainings. Execute only in the trainings database.
-- This example creates and removes its materialized view in one transaction.

BEGIN;
CREATE MATERIALIZED VIEW lesson_daily_sales_summary AS
SELECT day, sum(amount) AS total
FROM (VALUES (current_date, 10::numeric), (current_date, 15::numeric)) AS daily_sales(day, amount)
GROUP BY day;
SELECT * FROM lesson_daily_sales_summary;
REFRESH MATERIALIZED VIEW lesson_daily_sales_summary;
DROP MATERIALIZED VIEW lesson_daily_sales_summary;
COMMIT;
