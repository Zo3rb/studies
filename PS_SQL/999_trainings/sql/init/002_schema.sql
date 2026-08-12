CREATE TABLE users (
  id serial PRIMARY KEY,
  public_id uuid NOT NULL DEFAULT gen_random_uuid(),
  email varchar(255) NOT NULL,
  password_hash varchar(255),
  full_name varchar(150),
  language varchar(5) NOT NULL DEFAULT 'en' CHECK (language IN ('en', 'ar')),
  email_verified_at timestamptz,
  account_status varchar(20) NOT NULL DEFAULT 'active' CHECK (
    account_status IN ('active', 'suspended', 'pending_deletion')
  ),
  suspended_at timestamptz,
  suspension_reason text,
  avatar_file_id integer UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);
CREATE UNIQUE INDEX users_public_id_key ON users(public_id);
CREATE UNIQUE INDEX users_email_active_key ON users (lower(email))
WHERE deleted_at IS NULL;
CREATE TABLE organizations (
  id serial PRIMARY KEY,
  public_id uuid NOT NULL DEFAULT gen_random_uuid(),
  name varchar(150) NOT NULL,
  slug varchar(100) NOT NULL,
  status varchar(20) NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'suspended', 'deleted')),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);
CREATE UNIQUE INDEX organizations_public_id_key ON organizations(public_id);
CREATE UNIQUE INDEX organizations_slug_active_key ON organizations (lower(slug))
WHERE deleted_at IS NULL;
CREATE TABLE platform_roles (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  description text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE user_platform_roles (
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  platform_role_id integer NOT NULL REFERENCES platform_roles(id) ON DELETE CASCADE,
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (user_id, platform_role_id)
);
CREATE TABLE organization_memberships (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  status varchar(20) NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'suspended', 'removed')),
  joined_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (organization_id, user_id),
  UNIQUE (id, organization_id)
);
CREATE INDEX organization_memberships_user_id_idx ON organization_memberships(user_id);
CREATE TABLE organization_roles (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  name varchar(80) NOT NULL,
  is_system boolean NOT NULL DEFAULT false,
  description text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (organization_id, name),
  UNIQUE (id, organization_id)
);
CREATE TABLE organization_permissions (
  id serial PRIMARY KEY,
  permission_key varchar(100) NOT NULL UNIQUE,
  description text,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE organization_role_permissions (
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  organization_role_id integer NOT NULL,
  organization_permission_id integer NOT NULL REFERENCES organization_permissions(id) ON DELETE CASCADE,
  PRIMARY KEY (organization_role_id, organization_permission_id),
  FOREIGN KEY (organization_role_id, organization_id) REFERENCES organization_roles(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE organization_membership_roles (
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  organization_membership_id integer NOT NULL,
  organization_role_id integer NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (organization_membership_id, organization_role_id),
  FOREIGN KEY (organization_membership_id, organization_id) REFERENCES organization_memberships(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY (organization_role_id, organization_id) REFERENCES organization_roles(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE organization_invitations (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  email varchar(255) NOT NULL,
  organization_role_id integer REFERENCES organization_roles(id) ON DELETE
  SET NULL,
    token_hash varchar(255) NOT NULL UNIQUE,
    invited_by_membership_id integer REFERENCES organization_memberships(id) ON DELETE
  SET NULL,
    expires_at timestamptz NOT NULL,
    accepted_at timestamptz,
    revoked_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX organization_invitations_org_email_idx ON organization_invitations(organization_id, lower(email));
CREATE TABLE user_identities (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  provider varchar(30) NOT NULL CHECK (provider IN ('google', 'facebook')),
  provider_subject varchar(255) NOT NULL,
  provider_email varchar(255),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (provider, provider_subject)
);
CREATE TABLE email_verification_tokens (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token_hash varchar(255) NOT NULL UNIQUE,
  expires_at timestamptz NOT NULL,
  consumed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE password_reset_tokens (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token_hash varchar(255) NOT NULL UNIQUE,
  expires_at timestamptz NOT NULL,
  consumed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE privacy_requests (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
  request_type varchar(20) NOT NULL CHECK (request_type IN ('export', 'deletion')),
  status varchar(20) NOT NULL DEFAULT 'pending' CHECK (
    status IN ('pending', 'processing', 'completed', 'rejected')
  ),
  requested_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz,
  metadata jsonb
);
CREATE TABLE auth_sessions (
  id serial PRIMARY KEY,
  public_id uuid NOT NULL DEFAULT gen_random_uuid(),
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  device_label varchar(150),
  ip_address inet,
  user_agent text,
  created_at timestamptz NOT NULL DEFAULT now(),
  last_seen_at timestamptz NOT NULL DEFAULT now(),
  expires_at timestamptz NOT NULL,
  revoked_at timestamptz,
  revoke_reason varchar(100),
  UNIQUE (public_id)
);
CREATE INDEX auth_sessions_user_active_idx ON auth_sessions(user_id, expires_at)
WHERE revoked_at IS NULL;
CREATE TABLE refresh_tokens (
  id serial PRIMARY KEY,
  session_id integer NOT NULL REFERENCES auth_sessions(id) ON DELETE CASCADE,
  family_id uuid NOT NULL,
  token_hash varchar(255) NOT NULL UNIQUE,
  parent_token_id integer REFERENCES refresh_tokens(id) ON DELETE
  SET NULL,
    replaced_by_token_id integer UNIQUE REFERENCES refresh_tokens(id) ON DELETE
  SET NULL,
    issued_at timestamptz NOT NULL DEFAULT now(),
    expires_at timestamptz NOT NULL,
    used_at timestamptz,
    revoked_at timestamptz,
    reuse_detected_at timestamptz
);
CREATE INDEX refresh_tokens_family_idx ON refresh_tokens(family_id);
CREATE TABLE categories (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  name varchar(100) NOT NULL,
  description text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE (id, organization_id)
);
CREATE UNIQUE INDEX categories_org_name_key ON categories(organization_id, lower(name))
WHERE deleted_at IS NULL;
CREATE TABLE tags (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  name varchar(100) NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE (id, organization_id)
);
CREATE UNIQUE INDEX tags_org_name_key ON tags(organization_id, lower(name))
WHERE deleted_at IS NULL;
CREATE TABLE courses (
  id serial PRIMARY KEY,
  public_id uuid NOT NULL DEFAULT gen_random_uuid(),
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  title varchar(200) NOT NULL,
  description text,
  access_mode varchar(20) NOT NULL DEFAULT 'free' CHECK (
    access_mode IN (
      'free',
      'paid',
      'private',
      'invite_only',
      'subscription'
    )
  ),
  status varchar(20) NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
  primary_instructor_membership_id integer,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE (public_id),
  UNIQUE (id, organization_id),
  FOREIGN KEY (
    primary_instructor_membership_id,
    organization_id
  ) REFERENCES organization_memberships(id, organization_id) ON DELETE
  SET NULL (primary_instructor_membership_id)
);
CREATE INDEX courses_org_status_idx ON courses(organization_id, status);
CREATE TABLE course_instructors (
  course_id integer NOT NULL,
  organization_id integer NOT NULL,
  organization_membership_id integer NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(course_id, organization_membership_id),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(organization_membership_id, organization_id) REFERENCES organization_memberships(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE course_categories (
  course_id integer NOT NULL,
  organization_id integer NOT NULL,
  category_id integer NOT NULL,
  PRIMARY KEY(course_id, category_id),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(category_id, organization_id) REFERENCES categories(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE course_tags (
  course_id integer NOT NULL,
  organization_id integer NOT NULL,
  tag_id integer NOT NULL,
  PRIMARY KEY(course_id, tag_id),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(tag_id, organization_id) REFERENCES tags(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE modules (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  course_id integer NOT NULL,
  title varchar(200) NOT NULL,
  description text,
  order_index integer NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE(id, organization_id),
  UNIQUE(course_id, order_index),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE lessons (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  module_id integer NOT NULL,
  title varchar(200) NOT NULL,
  content text,
  order_index integer NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE(id, organization_id),
  UNIQUE(module_id, order_index),
  FOREIGN KEY(module_id, organization_id) REFERENCES modules(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE course_translations (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  course_id integer NOT NULL,
  language varchar(5) NOT NULL CHECK(language IN ('en', 'ar')),
  title varchar(200) NOT NULL,
  description text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(course_id, language),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE module_translations (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  module_id integer NOT NULL,
  language varchar(5) NOT NULL CHECK(language IN ('en', 'ar')),
  title varchar(200) NOT NULL,
  description text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(module_id, language),
  FOREIGN KEY(module_id, organization_id) REFERENCES modules(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE lesson_translations (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  lesson_id integer NOT NULL,
  language varchar(5) NOT NULL CHECK(language IN ('en', 'ar')),
  title varchar(200) NOT NULL,
  content text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(lesson_id, language),
  FOREIGN KEY(lesson_id, organization_id) REFERENCES lessons(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE uploaded_files (
  id serial PRIMARY KEY,
  public_id uuid NOT NULL DEFAULT gen_random_uuid(),
  organization_id integer REFERENCES organizations(id) ON DELETE CASCADE,
  owner_user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  file_purpose varchar(30) NOT NULL CHECK(
    file_purpose IN ('avatar', 'course_asset', 'lesson_attachment')
  ),
  original_name varchar(255) NOT NULL,
  storage_provider varchar(50) NOT NULL,
  storage_bucket varchar(255) NOT NULL,
  storage_key varchar(500) NOT NULL,
  mime_type varchar(100) NOT NULL,
  file_size_bytes bigint NOT NULL CHECK(file_size_bytes >= 0),
  checksum varchar(128),
  scan_status varchar(20) NOT NULL DEFAULT 'pending' CHECK(
    scan_status IN ('pending', 'scanning', 'clean', 'rejected')
  ),
  scanned_at timestamptz,
  is_public boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE(public_id),
  UNIQUE(storage_provider, storage_bucket, storage_key),
  UNIQUE(id, organization_id),
  CHECK (
    (
      file_purpose = 'avatar'
      AND organization_id IS NULL
    )
    OR (
      file_purpose <> 'avatar'
      AND organization_id IS NOT NULL
    )
  )
);
ALTER TABLE users
ADD CONSTRAINT users_avatar_file_fk FOREIGN KEY(avatar_file_id) REFERENCES uploaded_files(id) ON DELETE
SET NULL;
CREATE TABLE course_files (
  course_id integer NOT NULL,
  organization_id integer NOT NULL,
  uploaded_file_id integer NOT NULL,
  PRIMARY KEY(course_id, uploaded_file_id),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(uploaded_file_id, organization_id) REFERENCES uploaded_files(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE lesson_files (
  lesson_id integer NOT NULL,
  organization_id integer NOT NULL,
  uploaded_file_id integer NOT NULL,
  PRIMARY KEY(lesson_id, uploaded_file_id),
  FOREIGN KEY(lesson_id, organization_id) REFERENCES lessons(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(uploaded_file_id, organization_id) REFERENCES uploaded_files(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE enrollments (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id integer NOT NULL,
  status varchar(20) NOT NULL DEFAULT 'active' CHECK(
    status IN (
      'pending',
      'active',
      'completed',
      'expired',
      'cancelled'
    )
  ),
  entitlement_source varchar(30) NOT NULL DEFAULT 'manual' CHECK(
    entitlement_source IN ('manual', 'purchase', 'subscription', 'invitation')
  ),
  enrolled_at timestamptz NOT NULL DEFAULT now(),
  expires_at timestamptz,
  completed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE(id, organization_id),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX enrollments_active_key ON enrollments(organization_id, user_id, course_id)
WHERE deleted_at IS NULL
  AND status IN ('pending', 'active', 'completed');
CREATE TABLE lesson_progress (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  enrollment_id integer NOT NULL,
  lesson_id integer NOT NULL,
  completed_at timestamptz,
  progress_percent numeric(5, 2) NOT NULL DEFAULT 0 CHECK(
    progress_percent BETWEEN 0 AND 100
  ),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(enrollment_id, lesson_id),
  FOREIGN KEY(enrollment_id, organization_id) REFERENCES enrollments(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(lesson_id, organization_id) REFERENCES lessons(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE assessments (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  course_id integer NOT NULL,
  module_id integer,
  assessment_type varchar(20) NOT NULL CHECK(assessment_type IN ('module_quiz', 'final_exam')),
  title varchar(200) NOT NULL,
  passing_score numeric(5, 2) NOT NULL DEFAULT 70 CHECK(
    passing_score BETWEEN 0 AND 100
  ),
  time_limit_seconds integer CHECK(time_limit_seconds > 0),
  max_attempts integer CHECK(max_attempts > 0),
  is_required boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(id, organization_id),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(module_id, organization_id) REFERENCES modules(id, organization_id) ON DELETE CASCADE,
  CHECK(
    (
      assessment_type = 'final_exam'
      AND module_id IS NULL
    )
    OR (
      assessment_type = 'module_quiz'
      AND module_id IS NOT NULL
    )
  )
);
CREATE TABLE assessment_questions (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  assessment_id integer NOT NULL,
  question_text text NOT NULL,
  question_type varchar(30) NOT NULL CHECK(
    question_type IN (
      'single_choice',
      'multiple_choice',
      'true_false',
      'short_answer'
    )
  ),
  points numeric(8, 2) NOT NULL DEFAULT 1 CHECK(points > 0),
  order_index integer NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(assessment_id, order_index),
  UNIQUE(id, organization_id),
  FOREIGN KEY(assessment_id, organization_id) REFERENCES assessments(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE assessment_options (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  question_id integer NOT NULL,
  option_text text NOT NULL,
  is_correct boolean NOT NULL DEFAULT false,
  order_index integer NOT NULL,
  UNIQUE(question_id, order_index),
  FOREIGN KEY(question_id, organization_id) REFERENCES assessment_questions(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE assessment_attempts (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  enrollment_id integer NOT NULL,
  assessment_id integer NOT NULL,
  attempt_number integer NOT NULL,
  score numeric(5, 2) CHECK(
    score BETWEEN 0 AND 100
  ),
  passed boolean,
  status varchar(20) NOT NULL DEFAULT 'in_progress' CHECK(
    status IN (
      'in_progress',
      'submitted',
      'expired',
      'invalidated'
    )
  ),
  started_at timestamptz NOT NULL DEFAULT now(),
  submitted_at timestamptz,
  integrity_metadata jsonb,
  UNIQUE(enrollment_id, assessment_id, attempt_number),
  UNIQUE(id, organization_id),
  FOREIGN KEY(enrollment_id, organization_id) REFERENCES enrollments(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(assessment_id, organization_id) REFERENCES assessments(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE assessment_attempt_answers (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  assessment_attempt_id integer NOT NULL,
  question_id integer NOT NULL,
  answer jsonb,
  awarded_points numeric(8, 2),
  UNIQUE(assessment_attempt_id, question_id),
  FOREIGN KEY(assessment_attempt_id, organization_id) REFERENCES assessment_attempts(id, organization_id) ON DELETE CASCADE,
  FOREIGN KEY(question_id, organization_id) REFERENCES assessment_questions(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE certificates (
  id serial PRIMARY KEY,
  public_id uuid NOT NULL DEFAULT gen_random_uuid(),
  organization_id integer NOT NULL,
  enrollment_id integer NOT NULL,
  certificate_code varchar(100) NOT NULL UNIQUE,
  status varchar(20) NOT NULL DEFAULT 'active' CHECK(status IN ('active', 'revoked')),
  issued_at timestamptz NOT NULL DEFAULT now(),
  revoked_at timestamptz,
  revocation_reason text,
  metadata jsonb,
  UNIQUE(public_id),
  UNIQUE(enrollment_id),
  FOREIGN KEY(enrollment_id, organization_id) REFERENCES enrollments(id, organization_id) ON DELETE RESTRICT
);
CREATE TABLE course_reviews (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  enrollment_id integer NOT NULL,
  rating integer NOT NULL CHECK(
    rating BETWEEN 1 AND 5
  ),
  review_text text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz,
  UNIQUE(enrollment_id),
  FOREIGN KEY(enrollment_id, organization_id) REFERENCES enrollments(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE billing_accounts (
  id serial PRIMARY KEY,
  organization_id integer REFERENCES organizations(id) ON DELETE RESTRICT,
  user_id integer REFERENCES users(id) ON DELETE RESTRICT,
  currency varchar(3) NOT NULL DEFAULT 'EGP',
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CHECK((organization_id IS NULL) <> (user_id IS NULL))
);
CREATE TABLE billing_provider_customers (
  id serial PRIMARY KEY,
  billing_account_id integer NOT NULL REFERENCES billing_accounts(id) ON DELETE RESTRICT,
  provider varchar(50) NOT NULL,
  provider_customer_id varchar(255) NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(provider, provider_customer_id),
  UNIQUE(billing_account_id, provider)
);
CREATE TABLE subscriptions (
  id serial PRIMARY KEY,
  billing_account_id integer NOT NULL REFERENCES billing_accounts(id) ON DELETE RESTRICT,
  organization_id integer REFERENCES organizations(id) ON DELETE RESTRICT,
  provider varchar(50) NOT NULL,
  provider_subscription_id varchar(255) NOT NULL,
  status varchar(30) NOT NULL,
  current_period_start timestamptz,
  current_period_end timestamptz,
  cancel_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(provider, provider_subscription_id)
);
CREATE TABLE subscription_items (
  id serial PRIMARY KEY,
  subscription_id integer NOT NULL REFERENCES subscriptions(id) ON DELETE RESTRICT,
  product_key varchar(100) NOT NULL,
  quantity integer NOT NULL DEFAULT 1 CHECK(quantity > 0),
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE invoices (
  id serial PRIMARY KEY,
  billing_account_id integer NOT NULL REFERENCES billing_accounts(id) ON DELETE RESTRICT,
  provider varchar(50),
  provider_invoice_id varchar(255),
  amount_due numeric(12, 2) NOT NULL CHECK(amount_due >= 0),
  amount_paid numeric(12, 2) NOT NULL DEFAULT 0 CHECK(amount_paid >= 0),
  currency varchar(3) NOT NULL,
  status varchar(30) NOT NULL,
  issued_at timestamptz,
  due_at timestamptz,
  paid_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(provider, provider_invoice_id)
);
CREATE TABLE payments (
  id serial PRIMARY KEY,
  organization_id integer,
  enrollment_id integer,
  billing_account_id integer NOT NULL REFERENCES billing_accounts(id) ON DELETE RESTRICT,
  invoice_id integer REFERENCES invoices(id) ON DELETE RESTRICT,
  provider varchar(50),
  provider_payment_id varchar(255),
  amount numeric(12, 2) NOT NULL CHECK(amount >= 0),
  currency varchar(3) NOT NULL,
  status varchar(30) NOT NULL,
  paid_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  metadata jsonb,
  UNIQUE(provider, provider_payment_id),
  FOREIGN KEY(enrollment_id, organization_id) REFERENCES enrollments(id, organization_id) ON DELETE RESTRICT
);
CREATE TABLE payment_provider_events (
  id serial PRIMARY KEY,
  provider varchar(50) NOT NULL,
  provider_event_id varchar(255) NOT NULL,
  event_type varchar(100) NOT NULL,
  payload jsonb NOT NULL,
  received_at timestamptz NOT NULL DEFAULT now(),
  processed_at timestamptz,
  processing_error text,
  UNIQUE(provider, provider_event_id)
);
CREATE TABLE notifications (
  id serial PRIMARY KEY,
  organization_id integer REFERENCES organizations(id) ON DELETE CASCADE,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  notification_type varchar(50) NOT NULL,
  title varchar(200) NOT NULL,
  message text,
  is_read boolean NOT NULL DEFAULT false,
  metadata jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  read_at timestamptz
);
CREATE TABLE chat_rooms (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  course_id integer,
  room_type varchar(20) NOT NULL DEFAULT 'support',
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(id, organization_id),
  FOREIGN KEY(course_id, organization_id) REFERENCES courses(id, organization_id) ON DELETE
  SET NULL (course_id)
);
CREATE TABLE chat_messages (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  chat_room_id integer NOT NULL,
  sender_user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  message text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  FOREIGN KEY(chat_room_id, organization_id) REFERENCES chat_rooms(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE chat_participants (
  organization_id integer NOT NULL,
  chat_room_id integer NOT NULL,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  joined_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(chat_room_id, user_id),
  FOREIGN KEY(chat_room_id, organization_id) REFERENCES chat_rooms(id, organization_id) ON DELETE CASCADE
);
CREATE TABLE email_campaigns (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  name varchar(200) NOT NULL,
  subject varchar(255) NOT NULL,
  body_html text,
  body_text text,
  status varchar(20) NOT NULL DEFAULT 'draft',
  created_by_membership_id integer,
  scheduled_at timestamptz,
  sent_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(id, organization_id),
  FOREIGN KEY(created_by_membership_id, organization_id) REFERENCES organization_memberships(id, organization_id) ON DELETE
  SET NULL (created_by_membership_id)
);
CREATE TABLE email_logs (
  id serial PRIMARY KEY,
  organization_id integer NOT NULL,
  campaign_id integer,
  user_id integer REFERENCES users(id) ON DELETE
  SET NULL,
    email varchar(255) NOT NULL,
    status varchar(20) NOT NULL,
    sent_at timestamptz NOT NULL DEFAULT now(),
    opened_at timestamptz,
    clicked_at timestamptz,
    error_message text,
    metadata jsonb,
    FOREIGN KEY(campaign_id, organization_id) REFERENCES email_campaigns(id, organization_id) ON DELETE
  SET NULL (campaign_id)
);
CREATE TABLE audit_logs (
  id bigserial PRIMARY KEY,
  organization_id integer REFERENCES organizations(id) ON DELETE
  SET NULL,
    actor_user_id integer REFERENCES users(id) ON DELETE
  SET NULL,
    actor_session_id integer REFERENCES auth_sessions(id) ON DELETE
  SET NULL,
    impersonator_user_id integer REFERENCES users(id) ON DELETE
  SET NULL,
    event_type varchar(100) NOT NULL,
    target_type varchar(100),
    target_id varchar(100),
    request_id uuid,
    ip_address inet,
    user_agent text,
    old_data jsonb,
    new_data jsonb,
    metadata jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX audit_logs_org_created_idx ON audit_logs(organization_id, created_at DESC);