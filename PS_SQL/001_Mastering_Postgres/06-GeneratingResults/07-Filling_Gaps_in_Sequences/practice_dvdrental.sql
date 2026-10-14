-- Lesson 7: Filling Gaps in Sequences
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

WITH day_series AS (SELECT d::date AS day FROM generate_series(date '2025-01-01', date '2025-01-07', interval '1 day') AS g(d)),
observed AS (SELECT rental_date::date AS day, count(*) AS rental_count FROM rental GROUP BY 1)
SELECT day_series.day, COALESCE(observed.rental_count, 0) AS rental_count
FROM day_series LEFT JOIN observed USING (day) ORDER BY day_series.day;
