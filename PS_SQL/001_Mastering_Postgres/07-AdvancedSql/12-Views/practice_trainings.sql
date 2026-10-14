-- Lesson 12: Views
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

CREATE OR REPLACE TEMP VIEW high_values AS SELECT * FROM (VALUES ('a',10),('b',30)) AS v(label, amount) WHERE amount >= 20; SELECT * FROM high_values; DROP VIEW high_values;
