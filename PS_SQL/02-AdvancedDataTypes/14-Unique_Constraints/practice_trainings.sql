-- Lesson 14: Unique Constraints (trainings)

DROP TABLE IF EXISTS users_unique;

CREATE TABLE users_unique (
    user_id BIGSERIAL PRIMARY KEY,
    email TEXT UNIQUE,
    country_code TEXT NOT NULL,
    phone TEXT NOT NULL,
    username TEXT NOT NULL,
    CONSTRAINT uq_country_phone UNIQUE (country_code, phone),
    CONSTRAINT uq_username UNIQUE (username)
);

INSERT INTO users_unique (email, country_code, phone, username) VALUES
('ali@example.com', '+20', '100000001', 'ali'),
('mona@example.com', '+20', '100000002', 'mona'),
(NULL, '+1', '555000001', 'john');

SELECT user_id, email, country_code, phone, username
FROM users_unique
ORDER BY user_id;

