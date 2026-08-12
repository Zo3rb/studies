-- Lesson 08: Generated Columns (trainings)

DROP TABLE IF EXISTS sales_orders;

CREATE TABLE sales_orders (
    order_id BIGSERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
    total_amount NUMERIC(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    discounted_total NUMERIC(12,2) GENERATED ALWAYS AS ((quantity * unit_price) * 0.90) STORED
);

INSERT INTO sales_orders (product_name, quantity, unit_price) VALUES
('Keyboard', 2, 85.50),
('Mouse', 4, 25.00),
('Monitor', 1, 210.00);

SELECT order_id, product_name, quantity, unit_price, total_amount, discounted_total
FROM sales_orders
ORDER BY order_id;

UPDATE sales_orders
SET quantity = 3
WHERE product_name = 'Keyboard';

SELECT order_id, product_name, quantity, unit_price, total_amount
FROM sales_orders
ORDER BY order_id;

