-- Lesson 14: Removing Duplicate Rows
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

CREATE TEMP TABLE contacts(id int PRIMARY KEY, email text, created_at date); INSERT INTO contacts VALUES (1,'a@example.com','2024-01-01'),(2,'a@example.com','2024-02-01'),(3,'b@example.com','2024-01-01'); WITH ranked AS (SELECT id, row_number() OVER (PARTITION BY email ORDER BY created_at,id) AS rn FROM contacts) DELETE FROM contacts AS c USING ranked AS r WHERE c.id=r.id AND r.rn>1; SELECT * FROM contacts ORDER BY id; DROP TABLE contacts;
