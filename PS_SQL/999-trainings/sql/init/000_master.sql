\set ON_ERROR_STOP on

-- trainings-platform DB bootstrap (Phase 1)
-- Run with:
--   psql "$DATABASE_URL" -f sql/init/000_master.sql
--
-- Notes:
-- - This master script composes all init files in a dependency-safe order.
-- - It is intended for initial bootstrap of the schema.

BEGIN;

SET client_min_messages TO WARNING;
SET lock_timeout TO '10s';
SET statement_timeout TO '0';
SET search_path TO public;

\ir 001_roles.sql
\ir 002_users.sql
\ir 003_user_roles.sql
\ir 004_courses.sql
\ir 005_modules.sql
\ir 006_lessons.sql
\ir 007_enrollments.sql
\ir 008_quiz_attempts.sql
\ir 009_categories.sql
\ir 010_tags.sql
\ir 011_course_tags.sql
\ir 012_course_categories.sql
\ir 013_certificates.sql
\ir 014_audit_logs.sql
\ir 015_course_reviews.sql
\ir 016_payments.sql
\ir 017_notifications.sql
\ir 018_course_preview_videos.sql
\ir 019_chat_rooms.sql
\ir 020_chat_messages.sql
\ir 021_chat_participants.sql
\ir 022_email_campaigns.sql
\ir 023_email_logs.sql
\ir 024_course_translations.sql
\ir 025_module_translations.sql
\ir 026_lesson_translations.sql

COMMIT;