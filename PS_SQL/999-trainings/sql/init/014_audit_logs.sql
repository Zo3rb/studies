CREATE TABLE audit_logs (
    id serial PRIMARY KEY,
    user_id integer REFERENCES users(id) ON DELETE
    SET NULL,
        action varchar(100) NOT NULL,
        table_name varchar(100),
        record_id integer,
        old_data jsonb,
        new_data jsonb,
        ip_address inet,
        created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_audit_logs_user_id ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_action ON audit_logs(action);
CREATE INDEX idx_audit_logs_created_at ON audit_logs(created_at);