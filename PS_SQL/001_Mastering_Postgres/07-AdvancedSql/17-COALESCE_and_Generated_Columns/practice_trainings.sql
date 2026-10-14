-- Lesson 17: COALESCE and Generated Columns
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

CREATE TEMP TABLE line_item(quantity int, unit_price numeric, total numeric GENERATED ALWAYS AS (quantity*unit_price) STORED); INSERT INTO line_item(quantity,unit_price) VALUES (2,4.50); SELECT quantity, unit_price, total, coalesce(NULL::text, 'no note') AS note FROM line_item; DROP TABLE line_item;
