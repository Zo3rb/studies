-- Lesson 08: Recursive CTEs
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

WITH RECURSIVE rental_days(day) AS (SELECT min(rental_date)::date FROM rental UNION ALL SELECT day + 1 FROM rental_days WHERE day < (SELECT max(rental_date)::date FROM rental)) SELECT day FROM rental_days ORDER BY day LIMIT 20;
