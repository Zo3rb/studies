-- PostgreSQL Foundations
-- Run in the trainings database. This example intentionally uses public.
--
-- This demo creates a small customer/order model and demonstrates:
--   tables, types, constraints, inserts, filtering, ordering,
--   aggregation, and joins.
\ connect trainings
SET search_path TO public;
DROP TABLE IF EXISTS public.orders;
DROP TABLE IF EXISTS public.customers;
CREATE TABLE public.customers (
    customer_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name text NOT NULL,
    email text NOT NULL UNIQUE,
    active boolean NOT NULL DEFAULT TRUE,
    created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE public.orders (
    order_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id integer NOT NULL REFERENCES public.customers(customer_id),
    amount numeric(10, 2) NOT NULL CHECK (amount >= 0),
    status text NOT NULL CHECK (status IN ('pending', 'paid', 'cancelled')),
    ordered_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO public.customers (full_name, email)
VALUES ('Ada Lovelace', 'ada@example.com'),
    ('Grace Hopper', 'grace@example.com'),
    ('Alan Turing', 'alan@example.com');
INSERT INTO public.orders (customer_id, amount, status)
SELECT customer_id,
    125.50,
    'paid'
FROM public.customers
WHERE email = 'ada@example.com';
INSERT INTO public.orders (customer_id, amount, status)
SELECT customer_id,
    80.00,
    'pending'
FROM public.customers
WHERE email = 'grace@example.com';
INSERT INTO public.orders (customer_id, amount, status)
SELECT customer_id,
    250.00,
    'paid'
FROM public.customers
WHERE email = 'ada@example.com';
-- 1. Inspect the rows.
SELECT customer_id,
    full_name,
    email,
    active
FROM public.customers
ORDER BY customer_id;
-- 2. Filter and order orders.
SELECT order_id,
    customer_id,
    amount,
    status
FROM public.orders
WHERE status = 'paid'
ORDER BY amount DESC;
-- 3. Aggregate orders by customer.
SELECT customer_id,
    COUNT(*) AS order_count,
    SUM(amount) AS total_amount
FROM public.orders
GROUP BY customer_id
ORDER BY total_amount DESC;
-- 4. Join customers to their orders.
SELECT c.full_name,
    o.order_id,
    o.amount,
    o.status
FROM public.customers AS c
    JOIN public.orders AS o ON o.customer_id = c.customer_id
ORDER BY c.full_name,
    o.order_id;
-- 5. A LEFT JOIN includes customers who have no orders.
SELECT c.full_name,
    COUNT(o.order_id) AS order_count
FROM public.customers AS c
    LEFT JOIN public.orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id,
    c.full_name
ORDER BY c.full_name;
-- 6. Verify the constraints by trying these one at a time.
-- The following statements should fail and should not be kept in a real run:
--
-- INSERT INTO public.orders (customer_id, amount, status)
-- VALUES (999999, 10.00, 'paid'); -- foreign-key violation
--
-- INSERT INTO public.orders (customer_id, amount, status)
-- VALUES (1, -10.00, 'paid'); -- CHECK violation
--
-- INSERT INTO public.customers (full_name, email)
-- VALUES ('Duplicate Email', 'ada@example.com'); -- UNIQUE violation