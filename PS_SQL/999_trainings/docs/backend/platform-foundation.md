# Phase 2 Platform Foundation

**Status:** Approved design; implementation has not started.  
**Scope:** Multi-tenancy, identity, authorization, sessions, files, and local Docker architecture.

This document is the Phase 2 design baseline. It deliberately precedes all schema migrations and application code.

## Product Boundary

`trainings-platform` will be a multi-tenant SaaS for individual learners, organizations, and training providers. The product supports free, paid, private, invite-only, and subscription-entitled courses. A user can belong to multiple organizations, and an instructor can teach in multiple organizations.

The repository remains MIT licensed for now. Hosted-service pricing does not change the license decision; licensing may be revisited before a public commercial release.

## Workspace and Deployment Shape

The repository will become an npm-workspaces monorepo when application scaffolding begins:

- `apps/api` — TypeScript Express API, created in the first implementation slice
- `apps/web` — future React client
- `packages/*` — future shared contracts and utilities
- `docker/` — Docker configuration and development service configuration
- existing `docs`, `prisma`, `sql`, and `scripts` directories remain at the repository root

Docker Compose will provide the complete local environment: API, PostgreSQL, a separate test database, an S3-compatible local object-storage service, and a development email-capture service. No cloud account is required for local development.

The production shape is three-tier: client, stateless API service, and managed data/supporting services. The API is packaged as a portable Docker image so it can later run on a VPS, a managed container platform, or Kubernetes. Production PostgreSQL and object storage may be managed services; local Docker PostgreSQL is not a production requirement.

The required environments are development, test, staging, and production. Each has separate credentials and data. Secrets are supplied by the environment or a secrets manager and are never committed, baked into images, or placed in Compose files.

## Multi-tenancy

The initial tenancy model is one shared PostgreSQL database and `public` schema. Tenant-owned records will carry an `organization_id` foreign key. Tenant context is established from the authenticated request and must be checked in the application for every tenant-scoped operation.

PostgreSQL Row-Level Security (RLS) is a required defense-in-depth control for tenant-owned tables. It does not replace application authorization. The future implementation must set tenant context safely for each transaction and test that one organization cannot read or modify another organization's records.

Global records, such as platform users and platform-level roles, are not tenant-scoped. Organization membership and organization-owned resources are tenant-scoped. Existing global course data will be evaluated and migrated to organization ownership before tenant-aware endpoints are implemented.

### Planned tenancy entities

The following entities are approved for a documented Phase 2 schema migration; they are not part of the current Phase 1 schema yet:

- `organizations` — tenant/workspace identity and lifecycle
- `organization_memberships` — a user's membership and status in an organization
- `organization_invitations` — email invitations, role assignment, expiry, and acceptance
- `organization_roles` and permission assignment records — organization-customizable RBAC

Creating an organization automatically creates an active membership for its creator with the organization-owner role. Organization administrators may invite users by email and assign an initial organization role.

## Authorization Model

Authorization has two distinct layers:

- Platform roles: `platform_admin` and `support_agent`; these grant narrowly scoped platform operations.
- Organization roles: `organization_owner`, `organization_admin`, `billing_manager`, `instructor`, and `learner`.

The organization owner manages the organization and its administrators. Organization administrators manage memberships, invitations, and permitted organization resources. Billing managers manage organization billing. Instructors create and manage courses they are authorized to manage. Learners consume assigned or entitled courses.

Custom organization roles and permission sets are supported by the schema design. They will be implemented only after the fixed launch roles and permission matrix are documented and tested.

Support impersonation is permitted only for explicitly authorized platform staff. Every impersonation start, end, actor, target, reason, and action is auditable. Impersonation must not silently grant billing or credential-management privileges.

## Identity and Account Lifecycle

Release 1 supports email/password sign-in and Google/Facebook social sign-in. Self-registration, administrator-created users, and organization invitations are supported.

Users may sign in before verifying their email, but email verification is required before enrolling in or joining a course. The first release includes password reset, password change, account suspension, account deletion, and data export. MFA is intentionally deferred, but identity interfaces must allow it to be added later.

Passwords use a modern memory-hard password-hashing algorithm. The exact library and configuration will be selected and documented before the API scaffold is created. The initial password policy will be intentionally modest, with rate limiting and secure reset flows providing additional protection.

### Planned identity entities

The future Phase 2 migration will document entities for social identities, email-verification tokens, password-reset tokens, and account lifecycle events. Stored tokens are hashed; raw credential or token values are never stored.

## Sessions and Refresh Tokens

The browser session design uses short-lived access tokens and rotating refresh tokens with an absolute session expiry. Access tokens are sent as bearer tokens. Refresh tokens are restricted to secure, HTTP-only cookies and are never placed in browser local storage.

The maximum number of active sessions per user is **five**. When a new session would exceed this limit, the oldest eligible active session is revoked. Users can view and revoke their active sessions.

Each session records device label, IP address, user agent, creation time, last activity time, expiry, revocation state, and the refresh-token family needed to detect reuse. Refresh tokens rotate on every refresh. Reuse of a replaced token revokes the affected token family and requires re-authentication.

A password change, user suspension, role change, or confirmed compromise revokes all active sessions for that user. Authentication endpoints that use cookies require CSRF protection and appropriate cookie attributes, including `Secure`, `HttpOnly`, and an explicitly documented `SameSite` policy.

### Planned session entities

The Phase 2 migration will add persistent session and refresh-token records. Refresh-token records must support a hashed token value, parent/replacement relationship or equivalent family identifier, issued/expiry/revoked timestamps, and reuse detection. This supports device management, rotation, revocation, and incident response.

Future third-party API access uses separately scoped API credentials, not browser refresh tokens.

## Courses, Completion, and Files

Courses are organization-owned and can be free, paid, private, invite-only, or subscription-entitled. Enrollment policy may include approval, expiry, seat limits, organization assignment, and instructor assignment; the exact first-release configuration fields will be designed with the enrollment migration.

Course completion requires completion of its configured modules and quizzes plus the final exam. Certificates are publicly verifiable through a code or URL.

The first supported upload classes are profile avatars, course assets, and lesson attachments. Documents and images have a default maximum size of 10 MB. Video is stored in object storage and is not uploaded through the API in the first slice. Paid and private assets use short-lived signed URLs. Uploads are quarantined until malware scanning completes.

## Data Retention and Audit

Sessions and routine authentication data are retained for 90 days after expiry or revocation. Routine security logs are retained for 90 days unless an active investigation requires longer.

Financial records, payment-provider events, invoices, and audit records are not subject to the 90-day default. Their retention periods require a documented business and legal-policy review before payment processing is enabled.

Auditing includes sign-in events, failed sign-ins, session revocations, role and membership changes, content publication, enrollment changes, payment actions, and authorized support impersonation.

## Delivery Order

1. Document the API contract, role-permission matrix, and tenant data classification.
2. Design and review the Phase 2 schema migration for organizations, memberships, roles, identity tokens, and sessions.
3. Update native SQL and Prisma schema together, then validate a clean database build.
4. Create the npm-workspaces and Docker development scaffold.
5. Implement and test authentication, tenant context, RBAC, and session management before course CRUD.

No step may skip the preceding documentation and validation work.
