CREATE TABLE certificates (
    id serial PRIMARY KEY,
    enrollment_id integer NOT NULL UNIQUE REFERENCES enrollments(id) ON DELETE CASCADE,
    certificate_code varchar(100) NOT NULL UNIQUE,
    issued_at timestamptz NOT NULL DEFAULT now(),
    metadata jsonb,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz
);
CREATE INDEX idx_certificates_enrollment_id ON certificates(enrollment_id);
CREATE INDEX idx_certificates_code ON certificates(certificate_code);