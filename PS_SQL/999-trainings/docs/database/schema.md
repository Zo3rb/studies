# Database Schema (v1.1 – Phase 2 SaaS Baseline)

**Database:** `trainings`
**Status:** Approved Phase 2 baseline; implemented by the clean-bootstrap SQL. Prisma models cover the first backend slice and expand with documented endpoint work.

## Conventions

- Tables and columns use `snake_case`; Prisma models use singular PascalCase with explicit `@map` mappings.
- Internal keys are `serial` integers. Publicly addressable resources also have a `public_id uuid` generated with `pgcrypto`.
- Timestamps use `timestamptz`; mutable records have `created_at` and `updated_at`.
- Tenant-owned records carry `organization_id`. Tenant uniqueness and query indexes begin with `organization_id`.
- Soft deletion uses `deleted_at`; unique values use partial unique indexes where a deleted record must not block reuse.
- Security tokens are stored only as hashes. Financial/provider-event records and audit records are immutable.

## Tenant and Identity

- `users`, `user_identities`, `email_verification_tokens`, `password_reset_tokens`, `privacy_requests`
- `organizations`, `organization_memberships`, `organization_invitations`
- `platform_roles`, `user_platform_roles`
- `organization_roles`, `organization_permissions`, `organization_role_permissions`, `organization_membership_roles`
- `auth_sessions`, `refresh_tokens`

Users are global identities. Organizations are tenants. A membership links a user to an organization; roles are assigned through memberships. The organization creator receives the owner role. Refresh-token rotation is represented by session-scoped token families and hashed token rows.

## Learning Content and Access

- `categories`, `tags`, `courses`, `course_categories`, `course_tags`, `course_instructors`
- `modules`, `lessons`, and their translation tables
- `course_preview_videos`, `uploaded_files`, `course_files`, `lesson_files`
- `enrollments`, `lesson_progress`
- `assessments`, `assessment_questions`, `assessment_options`, `assessment_attempts`, `assessment_attempt_answers`
- `certificates`, `course_reviews`

Courses, categorization, uploads, and learning progress are organization-scoped. Course access supports `free`, `paid`, `private`, `invite_only`, and `subscription` modes. Completion requires configured lesson/module progress and passing the final assessment where one is required.

## Operations, Communication, and Billing

- `notifications`, `chat_rooms`, `chat_messages`, `chat_participants`
- `email_campaigns`, `email_logs`, `audit_logs`
- `billing_accounts`, `billing_provider_customers`, `subscriptions`, `subscription_items`, `invoices`, `payments`, `payment_provider_events`

Billing accounts may belong to either an organization or an individual user. Provider events are idempotent and immutable. Payment and invoice data is retained independently of session/security-log retention.

## Tenant Isolation

Tenant-owned tables enable and force PostgreSQL Row-Level Security. Policies compare `organization_id` with `app.current_organization_id`, a transaction-local setting established by the API. Direct database access is restricted to trusted migration/administration credentials. Application tests must prove cross-tenant reads and writes fail.

## Bootstrap and Migration Policy

`sql/init/001_extensions.sql`, `sql/init/002_schema.sql`, `sql/init/003_rls.sql`, and `sql/init/004_seed_platform_roles.sql` are the clean-database baseline, run by `bootstrap.sh`. The older Phase 1 per-table init scripts are retired.

For an already populated Phase 1 database, do **not** run the bootstrap scripts. Create a reviewed, reversible migration that introduces organizations, backfills an initial organization, adds tenant keys and data, validates constraints, and enables RLS only after tenant context is available.

## Prisma Coverage

`prisma/schema.prisma` models the first Phase 2 CRUD slice: users, organizations, memberships and organization roles, sessions and refresh tokens, courses, enrollments, and uploaded files. Native SQL remains authoritative for Row-Level Security, composite tenant constraints, audit/ledger tables, and later endpoint domains. Add Prisma models as each documented API domain is implemented.
