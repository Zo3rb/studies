-- Lesson 6: ROWS FROM
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT *
FROM ROWS FROM (
  generate_series(1, 4),
  unnest(ARRAY['bronze','silver'])
) WITH ORDINALITY AS x(number_value, tier, position);
