-- Lesson 01: Introduction to Advanced SQL
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

SELECT current_date AS today, version() AS postgres_version;
