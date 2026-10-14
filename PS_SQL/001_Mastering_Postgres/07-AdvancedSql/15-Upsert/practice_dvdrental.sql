-- Lesson 15: Upsert
-- Target database: dvdrental (course sample database).
-- Self-contained session-local example; no persistent objects or data changes.

CREATE TEMP TABLE lesson_inventory_item (sku text PRIMARY KEY, quantity int NOT NULL);
INSERT INTO lesson_inventory_item VALUES ('A1', 5);
INSERT INTO lesson_inventory_item VALUES ('A1', 3)
ON CONFLICT (sku) DO UPDATE
SET quantity = lesson_inventory_item.quantity + EXCLUDED.quantity
RETURNING sku, quantity;
DROP TABLE lesson_inventory_item;
