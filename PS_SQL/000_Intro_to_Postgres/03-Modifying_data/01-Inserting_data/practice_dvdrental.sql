-- ========================================================
-- Topic: Inserting Data
-- DATABASE: dvdrental
-- ========================================================

-- 1. Insert a new actor into the actor table
-- Note: 'last_update' has a default value (usually now()) so we don't strictly need to provide it.
INSERT INTO actor (first_name, last_name)
VALUES ('TOM', 'HARDY');

-- 2. Verify
SELECT * FROM actor WHERE first_name = 'TOM' AND last_name = 'HARDY';

-- (Cleanup so we don't permanently mess up the sample DB)
DELETE FROM actor WHERE first_name = 'TOM' AND last_name = 'HARDY';

