-- 1️⃣ Join example: list all orders with customer name
SELECT o.id AS order_id,
       c.name AS customer,
       o.amount,
       o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;

-- 2️⃣ CTE + window function: top 5 customers by total spend
WITH customer_spend AS (
    SELECT c.id, c.name, SUM(o.amount) AS total_spent
    FROM customers c
    JOIN orders o ON o.customer_id = c.id
    GROUP BY c.id, c.name
)
SELECT id, name, total_spent,
       ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS rank
FROM customer_spend
WHERE rank <= 5;

-- 3️⃣ Set operation: all unique product names from sales and returns
SELECT product_name FROM sales
UNION
SELECT product_name FROM returns;

-- 4️⃣ Subquery in WHERE: customers who spent more than the average spend
SELECT name FROM customers
WHERE id IN (
    SELECT customer_id FROM orders
    GROUP BY customer_id
    HAVING SUM(amount) > (SELECT AVG(total) FROM (
        SELECT SUM(amount) AS total FROM orders GROUP BY customer_id
    ) AS avg_table)
);

-- 5️⃣ EXPLAIN ANALYZE for performance insight
EXPLAIN ANALYZE
SELECT o.id, c.name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
WHERE o.amount > 1000;
