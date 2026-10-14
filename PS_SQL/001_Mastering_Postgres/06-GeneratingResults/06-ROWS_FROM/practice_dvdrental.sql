-- Lesson 6: ROWS FROM
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT *
FROM ROWS FROM (
  unnest(ARRAY['Drama','Comedy','Action']),
  generate_series(10, 11)
) WITH ORDINALITY AS x(category_name, code, position);
