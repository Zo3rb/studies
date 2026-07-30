-- Lesson 09: Text Search Types (trainings)

DROP TABLE IF EXISTS articles_fts;

CREATE TABLE articles_fts (
    article_id BIGSERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    search_vector TSVECTOR GENERATED ALWAYS AS (
        to_tsvector('english', coalesce(title, '') || ' ' || coalesce(body, ''))
    ) STORED
);

CREATE INDEX idx_articles_fts_vector ON articles_fts USING GIN (search_vector);

INSERT INTO articles_fts (title, body) VALUES
('PostgreSQL Arrays', 'Arrays are useful for storing repeated values in one row.'),
('JSONB Best Practices', 'Use JSONB with GIN indexes for fast containment queries.'),
('Foreign Key Design', 'Foreign keys enforce referential integrity between tables.');

SELECT article_id, title
FROM articles_fts
WHERE search_vector @@ plainto_tsquery('english', 'integrity tables');

SELECT article_id, title, ts_rank(search_vector, plainto_tsquery('english', 'queries fast')) AS rank_score
FROM articles_fts
WHERE search_vector @@ plainto_tsquery('english', 'queries fast')
ORDER BY rank_score DESC;

