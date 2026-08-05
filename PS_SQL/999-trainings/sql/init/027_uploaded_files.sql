-- Creating the 'uploaded_files' table for user-owned uploads and avatar references
CREATE TABLE uploaded_files (
    id SERIAL PRIMARY KEY,
    owner_user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    original_name VARCHAR(255) NOT NULL,
    storage_key VARCHAR(500) NOT NULL UNIQUE,
    mime_type VARCHAR(100),
    file_size_bytes BIGINT,
    checksum VARCHAR(128),
    is_public BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at TIMESTAMPTZ
);
CREATE INDEX idx_uploaded_files_owner_user_id ON uploaded_files(owner_user_id);
CREATE INDEX idx_uploaded_files_is_public ON uploaded_files(is_public);
ALTER TABLE users
ADD CONSTRAINT fk_users_avatar_file_id FOREIGN KEY (avatar_file_id) REFERENCES uploaded_files(id) ON DELETE
SET NULL;