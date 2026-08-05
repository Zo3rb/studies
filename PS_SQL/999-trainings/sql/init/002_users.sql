-- Creating the 'users' Table
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(150),
    avatar_file_id INTEGER UNIQUE,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at TIMESTAMPTZ
);
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_created_at ON users(created_at);
-- Adding 'Language' Column
ALTER TABLE users
ADD COLUMN language varchar(5) NOT NULL DEFAULT 'en' CHECK (language IN ('en', 'ar'));
CREATE INDEX idx_users_language ON users(language);