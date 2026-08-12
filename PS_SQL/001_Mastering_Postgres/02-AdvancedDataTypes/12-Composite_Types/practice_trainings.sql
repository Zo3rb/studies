-- Lesson 12: Composite Types (trainings)

DROP TABLE IF EXISTS trainees_composite;
DROP TYPE IF EXISTS contact_info_type;

CREATE TYPE contact_info_type AS (
    email TEXT,
    phone TEXT
);

CREATE TABLE trainees_composite (
    trainee_id BIGSERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    contact_info contact_info_type NOT NULL
);

INSERT INTO trainees_composite (full_name, contact_info) VALUES
('Ali Hasan', ROW('ali@example.com', '+201000000001')),
('Mona Adel', ROW('mona@example.com', '+201000000002'));

SELECT
    trainee_id,
    full_name,
    (contact_info).email AS email,
    (contact_info).phone AS phone
FROM trainees_composite
ORDER BY trainee_id;

