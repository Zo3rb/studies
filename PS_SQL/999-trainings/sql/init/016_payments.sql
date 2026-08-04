CREATE TABLE payments (
    id serial PRIMARY KEY,
    enrollment_id integer NOT NULL REFERENCES enrollments(id) ON DELETE RESTRICT,
    user_id integer NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    course_id integer NOT NULL REFERENCES courses(id) ON DELETE RESTRICT,
    amount numeric(10, 2) NOT NULL,
    currency varchar(3) NOT NULL DEFAULT 'USD',
    status varchar(20) NOT NULL DEFAULT 'pending',
    -- pending, paid, failed, refunded
    payment_gateway varchar(50),
    transaction_id varchar(100) UNIQUE,
    metadata jsonb,
    paid_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz
);
CREATE INDEX idx_payments_enrollment_id ON payments(enrollment_id);
CREATE INDEX idx_payments_user_id ON payments(user_id);
CREATE INDEX idx_payments_status ON payments(status);
CREATE INDEX idx_payments_transaction_id ON payments(transaction_id);