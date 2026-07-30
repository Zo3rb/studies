-- Lesson 09: Text Search Types (dvdrental)

WITH film_docs AS (
    SELECT
        f.film_id,
        f.title,
        to_tsvector('english', coalesce(f.title, '') || ' ' || coalesce(f.description, '')) AS doc
    FROM film AS f
)
SELECT film_id, title
FROM film_docs
WHERE doc @@ plainto_tsquery('english', 'drama family')
LIMIT 25;

WITH film_docs AS (
    SELECT
        f.film_id,
        f.title,
        to_tsvector('english', coalesce(f.title, '') || ' ' || coalesce(f.description, '')) AS doc
    FROM film AS f
)
SELECT
    film_id,
    title,
    ts_rank(doc, to_tsquery('english', 'love | action')) AS rank_score
FROM film_docs
WHERE doc @@ to_tsquery('english', 'love | action')
ORDER BY rank_score DESC
LIMIT 20;

