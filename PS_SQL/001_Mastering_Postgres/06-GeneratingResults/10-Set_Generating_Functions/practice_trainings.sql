-- Lesson 10: Set Generating Functions
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT n FROM generate_series(1, 10) AS g(n);

SELECT d::date FROM generate_series(date '2025-01-01', date '2025-01-05', interval '1 day') AS g(d);

SELECT position, color FROM unnest(ARRAY['red','green','blue']) WITH ORDINALITY AS u(color, position);
