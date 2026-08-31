-- ========================================================
-- Topic: Returning Data
-- DATABASE: dvdrental
-- ========================================================

-- Insert a new language and see what ID the database assigns it
INSERT INTO language (name)
VALUES ('Klingon')
RETURNING language_id, name, last_update;

-- Cleanup
DELETE FROM language WHERE name = 'Klingon';

