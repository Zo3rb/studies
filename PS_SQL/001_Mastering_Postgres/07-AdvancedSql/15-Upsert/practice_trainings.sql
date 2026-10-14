-- Lesson 15: Upsert
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

CREATE TEMP TABLE inventory_item(sku text PRIMARY KEY, quantity int NOT NULL); INSERT INTO inventory_item VALUES ('A1',5); INSERT INTO inventory_item VALUES ('A1',3) ON CONFLICT (sku) DO UPDATE SET quantity=inventory_item.quantity+EXCLUDED.quantity; SELECT * FROM inventory_item; DROP TABLE inventory_item;
