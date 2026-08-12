-- Lesson 08: Generated Columns (dvdrental)
-- dvdrental has no generated columns by default, so we inspect metadata and compare with computed projections.

SELECT table_schema, table_name, column_name, is_generated, generation_expression
FROM information_schema.columns
WHERE table_schema = 'public'
  AND is_generated <> 'NEVER'
ORDER BY table_name, ordinal_position;

SELECT
    p.payment_id,
    p.amount,
    p.amount * 0.15 AS vat_amount,
    p.amount * 1.15 AS amount_with_vat
FROM payment AS p
ORDER BY p.payment_id
LIMIT 20;

