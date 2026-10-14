-- Lesson 14: Removing Duplicate Rows
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT email, count(*) AS occurrences FROM customer GROUP BY email HAVING count(*) > 1 ORDER BY occurrences DESC, email; -- Read-only duplicate audit.
