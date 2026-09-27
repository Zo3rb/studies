# NS Boilerplate Project Context

## Status

- Current phase: Phase 1 - architecture interview
- Interview status: Batch 2 complete; Batch 3 is next
- Implementation status: no code or application structure has been created
- Scope rule: do not produce code, folders, diagrams, or a final blueprint until the interview is complete and the user confirms it

## Mission

Design a production-grade, domain-agnostic application boilerplate that is:

- Multi-tenant
- Fully Dockerized
- OAuth 2.1 / OIDC-based
- Compatible with multiple client applications
- Ready for business and application-layer implementation
- Secure, observable, testable, maintainable, and scalable

## Architecture expertise requested

The design should be guided by:

- Clean / Hexagonal Architecture
- Domain-Driven Design
- Modular monoliths
- Shared database, schema-per-tenant, and database-per-tenant SaaS models
- OAuth 2.1 / OIDC, RBAC / ABAC, and identity federation
- Docker, Kubernetes, and 12-Factor App principles
- CI/CD, observability, security baselines, and developer experience

## Interview protocol

- Interview before any implementation or architecture blueprint.
- Ask questions in batches of 5-8, grouped by theme.
- Wait for answers before continuing.
- Adapt follow-up questions to the answers.
- When the user asks for a recommendation, present 2-3 options, trade-offs, and a clear recommendation.
- Keep questions concrete and decision-oriented.
- Show the running Decision Log after every batch.
- Explicitly flag risky or irreversible decisions.
- Prefer production-grade defaults over toy examples.
- Optimize for maintainability, testability, security, and developer experience.

## Topics to cover during the interview

A. Product and scope: business domains, client applications, scale, MVP versus long-term vision.

B. Multi-tenancy: isolation model, tenant resolution, customization, provisioning/offboarding, residency and compliance.

C. Identity and access: identity provider, federation, RBAC/ABAC, policy enforcement, token lifecycle, M2M, compliance.

D. Language, framework, and runtime: stack, team constraints, execution model, architecture style, API style.

E. Data and persistence: database, cache, search, broker, migrations, event sourcing, outbox, CQRS.

F. Docker and infrastructure: local workflow, production platform, cloud, IaC, secrets.

G. API and gateway: gateway, versioning, pagination, errors, idempotency, rate limits.

H. Observability: logs, metrics, tracing, SLOs, alerting, audit logs.

I. Security: OWASP ASVS target, security scanning, penetration testing, threat modeling.

J. Testing and quality: coverage, Testcontainers, contract tests, E2E, linting, formatting, hooks.

K. CI/CD and delivery: CI platform, branching, deployment strategy, environments, promotion.

L. Developer experience and documentation: first-run target, docs, ADRs, OpenAPI, runbooks, onboarding, sample slice.

M. Non-functional requirements: latency, availability, RPO/RTO, cost, team and ownership.

## Phase 2 blueprint deliverables

After the interview is complete and the user confirms it, produce:

1. Architecture overview with Mermaid diagrams, chosen patterns, rationale, and rejected alternatives.
2. Repository strategy and complete folder tree, including domain, application, infrastructure, presentation, tests, shared libraries, contracts, and configuration.
3. Multi-tenancy implementation covering resolution, context propagation, isolation, RLS or equivalent, provisioning, caching, logs, and traces.
4. Auth and authorization covering OAuth/OIDC flows, validation, scopes, claims, policies, client registration, federation, sessions, CSRF, and cookies.
5. Data-layer standards covering schemas, auditing, soft deletion, concurrency, migrations, repositories, transactions, and outbox/events where appropriate.
6. Docker and Compose artifacts plus production image standards, environment examples, tagging, and Kubernetes/Helm skeleton where applicable.
7. CI/CD pipeline covering lint, test, build, scan, SBOM, signing, promotion, migrations, deployment, and rollback.
8. Observability baseline covering structured logs, trace propagation, metric names, dashboards, alerts, and health endpoints.
9. Security baseline mapped to the selected OWASP ASVS level, including headers, CORS, CSP, validation, secrets, dependency, and container scanning.
10. Testing strategy and scaffolding for unit, integration, isolation, contract, and E2E testing.
11. Documentation set including README, ADR template and initial ADRs, OpenAPI, runbooks, and onboarding.
12. One complete domain-agnostic or agreed sample vertical slice demonstrating all layers, tests, migrations, API, auth, and observability.
13. Consolidated Decision Log with rationale and alternatives.
14. Phased roadmap from bootstrap to production hardening.

## Batch 1 - Product and Multi-Tenancy

### Confirmed requirements

- Initial domain: IVF application for a client clinic.
- Client applications: web SPA and mobile application.
- Initial tenancy scale: 3 tenants.
- Initial tenant size: approximately 50 users per tenant, with multiple roles.
- Tenant isolation: database per tenant.
- Tenant resolution: subdomain.

### Proposed defaults awaiting confirmation

- Initial performance target: 25 peak requests per second per tenant, with capacity for 100 requests per second across the deployment. This is deliberately conservative for the initial three-tenant rollout and should be validated with realistic workflows and load tests.
- Initial data target: 100 GB per tenant over three years, excluding large medical media. Store large files in object storage with metadata in the tenant database; do not treat the database target as a medical-image archive.
- Product horizon: build an MVP foundation with production-grade platform capabilities, while keeping the architecture suitable for a long-term reusable SaaS platform. Avoid implementing speculative domain modules before the IVF workflows are known.
- Tenant customization: support tenant branding, custom domain readiness, feature flags, configurable quotas, role/permission configuration, retention settings, and timezone/locale. Keep the first release limited to branding, feature flags, quotas, and timezone/locale unless the clinic requires more.
- Tenant lifecycle: support controlled tenant creation, automated provisioning, active/trial/suspended states, export, soft deletion, and an explicit retention window before irreversible destruction. Destruction should require an administrative approval workflow and an auditable record.

### Risk notes

- Database-per-tenant improves isolation and future residency flexibility but increases provisioning, migration, backup, monitoring, and connection-management complexity.
- Subdomain resolution requires a trusted mapping from hostnames to tenant records. The host must never be the sole authorization signal; authenticated identity and tenant membership must also be checked.
- IVF data is highly sensitive health information. Compliance, retention, auditability, encryption, and access-control requirements may change the platform design materially.

## Batch 2 - Identity and Access

### Confirmed requirements

- Identity provider: Keycloak.
- Initial client authentication: web SPA and mobile clients using OAuth 2.1 Authorization Code with PKCE.
- Authorization approach: RBAC plus constrained contextual policies.
- Authorization enforcement: coarse gateway checks plus authoritative tenant- and resource-level checks in the application.
- M2M integrations: supported by the platform design, but not implemented in the MVP; add per clinic request.
- Initial user roles: platform administrator, tenant administrator, clinic administrator, doctor, embryologist, nurse, receptionist, billing user, patient, and support/operator.
- Initial languages: Arabic as the primary language and English as the second language.
- Localization source: external language resources rather than hard-coded UI text.

### Proposed defaults awaiting confirmation

- Access tokens: 5-10 minute lifetime.
- Refresh tokens: rotating refresh tokens with reuse detection and revocation.
- Session controls: server-side session/device tracking where applicable, explicit logout, administrator-triggered session revocation, and immediate access removal after staff deactivation.
- Role additions: privacy/compliance auditor, read-only clinician, laboratory integration operator, and tenant support administrator should be considered, but each should be enabled only when a concrete workflow requires it.
- Localization format: use BCP 47 language tags (`ar`, `en`) and ICU MessageFormat-compatible translation resources. Keep translations structured by feature/module, support pluralization and gender where needed, and make right-to-left layout a first-class concern rather than a later visual patch.
- Compliance posture: implement a compliance-ready baseline, then create a country/client compliance profile for each deployment. Do not claim HIPAA compliance solely because the product handles health data.
- Egypt hosting: treat Egypt-specific privacy, health-data, licensing, and cross-border transfer requirements as a legal/compliance workstream. AWS availability is an infrastructure decision, not the compliance decision itself.
- IVF regulation: require a jurisdiction profile per client deployment covering applicable IVF/assisted-reproduction rules, consent requirements, data retention, access restrictions, language, and audit obligations. Country-specific legal review is required before production use.

### Risk notes

- HIPAA applies based on the US healthcare context and covered-entity/business-associate relationships; it is not automatically applicable to an Egypt-hosted system. Other Egyptian and client-country obligations may still apply.
- IVF and reproductive-health workflows can be subject to rules that vary significantly by country, including eligibility, consent, genetic material handling, donor records, data retention, and access to clinical information. These rules must be configurable only where legally appropriate and reviewed by qualified local counsel.
- Arabic localization affects data modeling, search, sorting, reporting, dates, numbers, layout direction, and clinical terminology; it should be treated as a platform requirement from the beginning.

## Current Decision Log

- Confirmed: initial domain is an IVF clinic application.
- Confirmed: clients are a web SPA and mobile application.
- Confirmed: start with 3 tenants and approximately 50 users per tenant.
- Confirmed: use database-per-tenant isolation.
- Confirmed: resolve tenants through subdomains.
- Proposed: target 25 peak RPS per tenant and 100 peak RPS across the deployment; validate with load testing.
- Proposed: target 100 GB of database data per tenant over three years, with large files in object storage.
- Proposed: deliver an MVP foundation that can evolve into a reusable long-term SaaS platform.
- Proposed: provide branding, feature flags, quotas, role/permission configuration, retention settings, timezone, and locale support, with a smaller subset in the first release.
- Proposed: implement controlled provisioning, lifecycle states, export, soft deletion, retention, and approval-based destruction.
- Confirmed: use Keycloak as the identity provider.
- Confirmed: support the listed platform, tenant, clinic, clinical, administrative, patient, and support roles, with additional essential roles evaluated as workflows are defined.
- Confirmed: use RBAC plus constrained contextual policies and enforce authoritative authorization in the application.
- Confirmed: design for M2M integrations but defer implementation until a clinic requests one.
- Confirmed: Arabic-first and English-second localization for the first release.
- Proposed: use short-lived access tokens, rotating refresh tokens, revocation, and administrator-controlled session termination.
- Proposed: use BCP 47 locale tags and ICU MessageFormat-compatible, feature-scoped translation resources with first-class RTL support.
- Proposed: maintain a compliance-ready baseline with deployment-specific country and client profiles; do not assume HIPAA applies without legal confirmation.
- Proposed: require jurisdiction-specific IVF regulation review before production deployment.

Recommendations remain proposals until explicitly confirmed by the user.

## Working constraints

- This file is a planning record, not implementation.
- Do not commit changes unless explicitly requested.
- Keep project-specific decisions and follow-up context in this folder as the project evolves.
