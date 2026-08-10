CREATE OR REPLACE FUNCTION current_organization_id() RETURNS integer
LANGUAGE sql STABLE AS $$ SELECT NULLIF(current_setting('app.current_organization_id', true), '')::integer $$;
CREATE OR REPLACE FUNCTION current_user_id() RETURNS integer
LANGUAGE sql STABLE AS $$ SELECT NULLIF(current_setting('app.current_user_id', true), '')::integer $$;

DO $$
DECLARE table_name text;
BEGIN
  FOREACH table_name IN ARRAY ARRAY[
    'organization_memberships','organization_roles','organization_role_permissions','organization_membership_roles','organization_invitations','categories','tags','courses','course_instructors','course_categories','course_tags','modules','lessons','course_translations','module_translations','lesson_translations','course_files','lesson_files','enrollments','lesson_progress','assessments','assessment_questions','assessment_options','assessment_attempts','assessment_attempt_answers','certificates','course_reviews','notifications','chat_rooms','chat_messages','chat_participants','email_campaigns','email_logs','audit_logs'
  ] LOOP
    EXECUTE format('ALTER TABLE %I ENABLE ROW LEVEL SECURITY', table_name);
    EXECUTE format('ALTER TABLE %I FORCE ROW LEVEL SECURITY', table_name);
    EXECUTE format('CREATE POLICY tenant_isolation ON %I USING (organization_id = current_organization_id()) WITH CHECK (organization_id = current_organization_id())', table_name);
  END LOOP;
END $$;

ALTER TABLE uploaded_files ENABLE ROW LEVEL SECURITY;
ALTER TABLE uploaded_files FORCE ROW LEVEL SECURITY;
CREATE POLICY uploaded_file_isolation ON uploaded_files
  USING (organization_id = current_organization_id() OR (organization_id IS NULL AND owner_user_id = current_user_id()))
  WITH CHECK (organization_id = current_organization_id() OR (organization_id IS NULL AND owner_user_id = current_user_id()));
