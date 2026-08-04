CREATE TABLE email_logs (
    id serial PRIMARY KEY,
    campaign_id integer REFERENCES email_campaigns(id) ON DELETE
    SET NULL,
        user_id integer REFERENCES users(id) ON DELETE CASCADE,
        email varchar(255) NOT NULL,
        status varchar(20) NOT NULL,
        -- sent, delivered, opened, clicked, bounced, failed
        sent_at timestamptz NOT NULL DEFAULT now(),
        opened_at timestamptz,
        clicked_at timestamptz,
        error_message text,
        metadata jsonb,
        created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_email_logs_campaign_id ON email_logs(campaign_id);
CREATE INDEX idx_email_logs_user_id ON email_logs(user_id);
CREATE INDEX idx_email_logs_status ON email_logs(status);