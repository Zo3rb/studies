-- ========================================================
-- Topic: Updating JSON
-- DATABASE: dvdrental
-- ========================================================

-- Since dvdrental lacks native JSONB columns to update, we can demonstrate 
-- jsonb_set on the fly within a SELECT statement.

WITH temp_json AS (
    SELECT CAST(row_to_json(customer) AS JSONB) AS payload
    FROM customer
    WHERE customer_id = 1
)
SELECT 
    payload AS original_json,
    jsonb_set(payload, '{first_name}', '"UPDATED_NAME"'::jsonb) AS updated_json
FROM temp_json;

