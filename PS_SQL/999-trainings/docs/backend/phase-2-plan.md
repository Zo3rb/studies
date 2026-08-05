# Phase 2 Backend Plan

## Purpose

Phase 2 turns the documented database foundation into a working REST backend. The goal is to build the API layer in a controlled order so the first implementation slice is stable and testable before the surface area grows.

## Scope

- REST API for the core platform domains
- Auth, session handling, and RBAC-aware request flow
- Prisma-backed CRUD for standard operations
- Native SQL for reporting, special-case reads, and performance-sensitive queries
- File upload metadata support for avatars and future attachments
- Future API documentation layer for interactive testing and reference (OpenAPI/Swagger)

## Execution Order

1. Finalize API conventions.
   - Base path
   - JSON response shape
   - Error format
   - Pagination and filtering rules
   - Authentication header and authorization flow

2. Scaffold the backend application.
   - Express entrypoint
   - Prisma client wiring
   - Environment config loading
   - Centralized error handling and logging

3. Implement auth and access control.
   - Login flow
   - Role checks
   - Protected routes
   - Current-user context

4. Implement the first resource slice.
   - Users
   - Courses
   - Enrollments
   - Uploaded files / avatar linkage

5. Add supporting domain endpoints.
   - Categories and tags
   - Modules and lessons
   - Reviews, notifications, and payments as the scope expands

6. Add quality gates.
   - Integration tests for critical paths
   - Basic request validation
   - Smoke tests for startup and database connectivity

7. Add API documentation tooling.
   - OpenAPI/Swagger for endpoint exploration and testing
   - Keep the generated docs aligned with the documented endpoint map

## Exit Criteria

Phase 2 is ready to close when the backend has:

- a documented endpoint map,
- a repeatable startup path,
- auth and RBAC enforcement,
- at least one end-to-end CRUD slice,
- API documentation tooling planned or in place for testing and exploration,
- and tests covering the critical flow(s) chosen for the phase.
