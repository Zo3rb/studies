-- Lesson 7: Filling Gaps in Sequences
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

WITH days AS (
  SELECT d::date AS rental_day FROM generate_series(
    (SELECT min(rental_date)::date FROM rental),
    (SELECT max(rental_date)::date FROM rental),
    interval '1 day') AS g(d)
), daily AS (
  SELECT rental_date::date AS rental_day, count(*) AS rentals FROM rental GROUP BY 1
)
SELECT days.rental_day, COALESCE(daily.rentals, 0) AS rentals
FROM days LEFT JOIN daily USING (rental_day)
ORDER BY days.rental_day;
