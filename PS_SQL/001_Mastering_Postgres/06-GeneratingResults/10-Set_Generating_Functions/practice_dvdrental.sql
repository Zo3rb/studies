-- Lesson 10: Set Generating Functions
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT d::date AS day
FROM generate_series(date '2025-01-01', date '2025-01-07', interval '1 day') AS g(d);

SELECT category, position FROM unnest(ARRAY['Action','Animation','Children','Classics']) WITH ORDINALITY AS u(category, position);
