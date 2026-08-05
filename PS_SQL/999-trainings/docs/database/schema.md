# Database Schema (v1.0 – Finalized)

**Database**: `trainings`  
**Last Updated**: August 2026  
**Status**: Phase 1 – Complete (Schema finalized)

---

## 1. Naming Conventions (Locked)

(See previous version – unchanged)

---

## 2. Complete Entity List (v1)

### RBAC & Users

- `roles`
- `users` (+ `language` column for EN/AR)
- `uploaded_files` (+ `users.avatar_file_id` for optional profile avatar)
- `user_roles`

### Content & Translations

- `courses`
- `course_translations`
- `modules`
- `module_translations`
- `lessons`
- `lesson_translations`

### Preview Videos

- `course_preview_videos`

### Enrollments & Progress

- `enrollments`
- `quiz_attempts`
- `certificates`

### Categorization & Tagging

- `categories`
- `tags`
- `course_categories`
- `course_tags`

### Real-time Chat

- `chat_rooms`
- `chat_messages`
- `chat_participants`

### Business Features

- `payments`
- `course_reviews`
- `notifications`
- `email_campaigns`
- `email_logs`

### Audit

- `audit_logs`

---

## 3. Full Relationships Overview

- Users have roles via `user_roles`
- Users may own uploaded files via `uploaded_files`, and `users.avatar_file_id` can point to one uploaded file for the profile avatar
- Courses → Modules → Lessons (hierarchical)
- Courses have many preview videos
- Courses, Modules, Lessons have translations (`_translations` tables)
- Enrollments link Users ↔ Courses
- Quiz attempts are linked to enrollments + modules
- Many-to-many: Courses ↔ Categories, Courses ↔ Tags
- Full audit trail via `audit_logs`
- Email campaigns + delivery tracking
- Real-time chat rooms with participants and messages

## 4. Phase 1 Cleanup Notes

- The course-to-category relationship is modeled with a nullable `courses.category_id` FK to `categories` and the explicit join table `course_categories` for multi-category assignment.
- Init scripts now use valid foreign key references and a schema-safe DDL order so the database can be created cleanly in the documented sequence.
- Uploaded files are modeled separately from avatars so the same storage pattern can support future attachments without tying the schema to a single use case.

---

**Phase 1 is now complete.**
