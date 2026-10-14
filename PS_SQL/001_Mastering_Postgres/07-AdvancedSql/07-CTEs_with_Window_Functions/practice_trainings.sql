-- Lesson 07: CTEs with Window Functions
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

WITH ranked AS (SELECT department, employee, salary, row_number() OVER (PARTITION BY department ORDER BY salary DESC, employee) AS rn FROM (VALUES ('A','Lee',90), ('A','Kim',95), ('B','Jo',80)) AS e(department, employee, salary)) SELECT * FROM ranked WHERE rn <= 1 ORDER BY department;
