CREATE TABLE email_campaigns (
    id serial PRIMARY KEY,
    name varchar(200) NOT NULL,
    subject varchar(255) NOT NULL,
    body_html text,
    body_text text,
    status varchar(20) NOT NULL DEFAULT 'draft',
    -- draft, scheduled, sent, cancelled
    scheduled_at timestamptz,
    sent_at timestamptz,
    created_by integer REFERENCES users(id) ON DELETE
    SET NULL,
        created_at timestamptz NOT NULL DEFAULT now(),
        updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_email_campaigns_status ON email_campaigns(status);
CREATE INDEX idx_email_campaigns_scheduled_at ON email_campaigns(scheduled_at);