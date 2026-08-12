INSERT INTO platform_roles (name, description) VALUES
  ('platform_admin', 'Platform-wide administration'),
  ('support_agent', 'Audited customer support operations')
ON CONFLICT (name) DO NOTHING;
