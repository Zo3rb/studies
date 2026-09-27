# NS Boilerplate Project Context

## Status

- Current phase: Phase 1 - architecture interview
- Interview status: Batch 11 complete; interview complete pending user confirmation before Phase 2
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

## Batch 3 - Language, Framework and Runtime

### Confirmed requirements

- Web client: React with Vite.
- Mobile client: React Native.
- Backend architecture: modular monolith designed for future extraction.
- Execution model: synchronous APIs plus background jobs.
- Public API: REST with WebSocket support.
- Contracts: strongly typed client generation from the API contract.
- Maintainers: one developer and the assistant; minimize operational and technology-stack complexity.

### Proposed defaults awaiting confirmation

- Primary application backend: TypeScript with NestJS. This keeps the core platform, API, shared contracts, tooling, and most product code in one ecosystem, which is a meaningful advantage for a very small maintenance group.
- ML and advanced reporting: do not make Python/FastAPI a second primary backend yet. Introduce Python workers or an independently deployable Python service behind an explicit job/API boundary when a real ML or reporting workload requires Python libraries. This preserves access to the Python ecosystem without forcing two full application stacks into the MVP.
- API contracts: OpenAPI as the source of truth, with generated TypeScript clients and runtime validation schemas for the web and mobile clients. Generated artifacts should be versioned or reproducibly generated in CI according to the final repository workflow.
- WebSockets: use them selectively for operational updates, notifications, long-running job progress, and other justified real-time workflows. Keep clinical writes and authorization decisions on ordinary authenticated REST requests.
- Background jobs: use them for tenant provisioning, exports, notifications, document/file processing, report generation, audit processing, and future integration adapters.

### Risk notes

- A second Python runtime increases deployment, dependency, security-scanning, observability, and debugging overhead. Introducing it only behind a clear workload boundary limits that cost.
- ML and reporting requirements may eventually need a separate analytical data model or warehouse. Do not couple early transactional schemas directly to speculative analytics workloads.
- WebSocket authorization, tenant context propagation, reconnect behavior, and auditability require explicit design; WebSockets must not bypass the same access rules as REST.

## Current Decision Log

- Confirmed: use React with Vite for the web client.
- Confirmed: use React Native for mobile.
- Confirmed: use a modular monolith with synchronous APIs and background jobs.
- Confirmed: expose REST publicly with selective WebSocket support.
- Confirmed: use strongly typed generated clients and API contracts.
- Confirmed: the project is maintained by a very small group, currently one developer plus the assistant.
- Proposed: use TypeScript/NestJS as the primary application backend.
- Proposed: introduce Python only as a later ML/reporting worker or service behind a job/API boundary.
- Proposed: use OpenAPI as the source of truth for generated clients and runtime validation.

## Batch 4 - Data and Persistence

### Confirmed requirements

- Primary relational database: PostgreSQL.
- Control plane: use a central control-plane database for tenant registry, database mapping, identity references, provisioning state, lifecycle, jurisdiction, and platform configuration metadata.
- Tenant data: one clinical database per tenant.
- Redis: use for caching, rate limiting, distributed locks, and background jobs; Redis is not a source of truth for clinical data.
- Search: start with PostgreSQL indexes and full-text capabilities; defer OpenSearch and vector search until justified by real workflows.
- Background jobs: use BullMQ backed by the selected Redis deployment for the MVP.
- Migrations: use one versioned application migration stream, applied through a controlled migration service to each tenant database.
- Consistency/events: use ordinary transactional writes plus the outbox pattern; defer full event sourcing and broad CQRS.
- Clinical files: use encrypted object storage with metadata and access control represented in the tenant database.

### Proposed defaults awaiting confirmation

- Control-plane database contents: keep only platform metadata, tenant routing, lifecycle, provisioning, jurisdiction, and configuration records in the control plane. Clinical and patient records remain in the tenant database.
- Redis deployment: begin with a logically separated Redis instance or namespaces for cache, BullMQ, locks, and rate limits, with explicit key prefixes and TTL policies. Split into separate Redis deployments only when workload isolation or compliance requires it.
- Tenant migration rollout: apply migrations tenant-by-tenant with compatibility checks, status tracking, retries, alerting, pause/resume controls, and a documented recovery procedure. Prefer forward-compatible expand-and-contract migrations over destructive changes.
- Outbox processing: write outbox records in the same transaction as the clinical change, then publish asynchronously with idempotency keys, retry policy, dead-letter handling, and tenant context.
- File storage: store large files in S3-compatible or cloud object storage, encrypt at rest and in transit, scan uploads, keep immutable metadata and audit records in the tenant database, and issue short-lived signed download URLs after authorization.
- Reporting and ML: keep transactional PostgreSQL workloads separate from future analytical workloads. Add read models, an analytics store, or a warehouse only when report volume or ML requirements justify it.

### Risk notes

- Database-per-tenant makes backup, restore, migrations, monitoring, connection pooling, and disaster recovery materially more complex than a shared database.
- A central control plane is highly sensitive: incorrect tenant-to-database routing could expose data across tenants. Routing changes need authorization, audit trails, validation, and safe rollout procedures.
- Redis-backed jobs are appropriate for MVP operational jobs, but clinical events must remain durable in PostgreSQL through the outbox pattern. Redis loss must not lose a clinical write.
- Clinical file retention, encryption-key ownership, backup immutability, and recovery testing require explicit decisions before production.
- Confirmed: use PostgreSQL as the primary relational database.
- Confirmed: use a central control-plane database plus one clinical database per tenant.
- Confirmed: use Redis for caching, rate limiting, distributed locks, and background jobs.
- Confirmed: use PostgreSQL search initially and defer OpenSearch/vector search.
- Confirmed: use BullMQ backed by Redis for MVP background jobs.
- Confirmed: use centrally orchestrated, versioned migrations across tenant databases.
- Confirmed: use transactional writes plus an outbox pattern; defer full event sourcing and broad CQRS.
- Confirmed: use encrypted object storage for large clinical files with database metadata and controlled access.
- Proposed: use explicit Redis namespaces and TTLs, tenant-by-tenant migration rollout, idempotent outbox processing, and expand-and-contract migrations.

## Batch 5 - Docker and Infrastructure

### Confirmed requirements

- Local development: Docker Compose with optional Dev Containers.
- Production target: Kubernetes-ready deployment artifacts, while Compose remains the local workflow.
- Cloud strategy: cloud-agnostic application design with an AWS-compatible deployment path, subject to client requirements for Egypt-only hosting.
- Infrastructure as code: Terraform.
- Secrets: local environment variables for development; SOPS-encrypted configuration or a cloud-native secret manager for deployed environments; no plaintext secrets in source control.
- Local Compose: include API, worker, PostgreSQL, Redis, and Keycloak by default; observability services are optional through a Compose profile.
- Workload separation: support independently deployable API, background worker, migration runner, WebSocket gateway, and scheduled-job processes within one repository and image family.
- Developer experience: target a complete local first run in under 10 minutes, with a faster minimal mode.

### Proposed defaults awaiting confirmation

- Container images: use multi-stage builds, non-root runtime users, minimal production images, pinned base-image digests where practical, health checks, deterministic builds, and separate targets for API, worker, migrations, and scheduled jobs.
- Kubernetes packaging: provide Helm or Kustomize artifacts with resource requests/limits, security contexts, probes, PodDisruptionBudgets where relevant, network policies, and environment overlays. Select the packaging format during the implementation blueprint.
- Environment boundaries: keep local, development, staging, and production configuration separate. Production migrations should run as an explicit controlled job rather than automatically on API startup.
- Tenant databases: provision, migrate, back up, monitor, and restore tenant databases through explicit platform workflows rather than ad hoc container commands.
- Egypt deployment: preserve provider-neutral interfaces for object storage, secrets, databases, and telemetry so an Egypt-based provider can replace AWS services when required.

### Risk notes

- Kubernetes adds significant operational overhead for a very small maintenance group. The blueprint should keep the first production deployment as simple as possible and avoid premature service sprawl.
- Cloud-agnostic design can become an expensive abstraction if every provider is supported equally. Target one reference deployment and keep portability at the infrastructure-adapter boundaries.
- Secret-management choice and Egypt hosting requirements may be constrained by the client’s legal, procurement, and operations policies.
- Confirmed: use Docker Compose with optional Dev Containers locally.
- Confirmed: make the application Kubernetes-ready with Terraform-managed infrastructure.
- Confirmed: target cloud-agnostic application boundaries with an AWS-compatible reference deployment.
- Confirmed: use local environment variables and deployed-environment secret management through SOPS or a cloud-native secret manager.
- Confirmed: keep observability optional in the default Compose profile.
- Confirmed: separate API, worker, migration, WebSocket, and scheduled-job workloads while retaining one repository and image family.
- Confirmed: target a complete local first run in under 10 minutes.
- Proposed: use hardened multi-stage non-root images, explicit production migration jobs, Kubernetes security defaults, and provider-neutral infrastructure adapters.

Recommendations remain proposals until explicitly confirmed by the user.

## Batch 11 - Non-Functional Requirements

### Confirmed requirements

- Availability target: 99.9% monthly production API availability, excluding planned maintenance.
- Latency target: p95 below 500 ms for ordinary authenticated reads and writes. Reports, exports, uploads, and ML workloads are asynchronous.
- Recovery Point Objective: 15 minutes for clinical databases initially.
- Recovery Time Objective: under 4 hours initially.
- Cost posture: balance MVP cost and reliability; clinical-data protection and compliance are non-negotiable.
- Growth target: optimize for the initial 3 tenants while making 50 tenants a realistic next step for provisioning, migrations, monitoring, backups, and connection management.
- Maintenance: no planned downtime for ordinary application releases; controlled maintenance windows are allowed for major database, infrastructure, or Keycloak changes.
- Operations ownership: shared responsibility. The application owner manages application releases and behavior; hosting/client operations manage infrastructure access, backups, networking, and regional compliance until the operating model changes.

### Learning-oriented explanations

- An availability target describes how often the service should be usable. 99.9% monthly availability permits roughly 43 minutes of unavailability in a 30-day month, so it must be measured rather than treated as a slogan.
- p95 latency means 95% of measured requests finish within the target. It prevents a fast average from hiding a poor experience for a meaningful group of users.
- RPO, or Recovery Point Objective, describes how much recent data may be lost after a disaster. A 15-minute RPO means backups or replication should limit loss to roughly the previous 15 minutes.
- RTO, or Recovery Time Objective, describes how long restoration may take. An RTO under 4 hours requires tested backups, documented recovery steps, access to infrastructure, and people who can perform them.
- A maintenance window is an approved period for risky infrastructure or database work. Ordinary application releases should use compatible rolling deployment so users do not need to wait for maintenance.
- A growth target is not a promise that the system can scale forever. It identifies the next capacity milestone that should be verified with load tests, operational measurements, and cost review.

### Risk notes

- Availability, RPO, and RTO become contractual commitments only after realistic load tests, backup/restore tests, monitoring, and disaster-recovery exercises validate them.
- Database-per-tenant recovery must be tested per tenant and at fleet level. Restoring one tenant must not accidentally overwrite another tenant or control-plane routing.
- Shared operations ownership requires a written responsibility matrix, escalation contacts, access procedures, and incident handoff rules before production.

## Batch 11 Decision Log

- Confirmed: target 99.9% monthly API availability.
- Confirmed: target p95 latency below 500 ms for ordinary authenticated requests.
- Confirmed: target 15-minute RPO for clinical databases initially.
- Confirmed: target an initial RTO under 4 hours.
- Confirmed: balance cost and reliability while treating clinical-data protection and compliance as non-negotiable.
- Confirmed: design for 3 initial tenants with a credible path to 50 tenants.
- Confirmed: avoid planned downtime for ordinary releases.
- Confirmed: use shared application and infrastructure operations responsibility.

## Interview Completion Gate

All requested interview areas A-M have now been covered across Batches 1-11. Phase 2 must not begin until the user explicitly confirms that the interview is complete and authorizes the blueprint.

Recommendations remain proposals until explicitly confirmed by the user.

## Batch 9 - CI/CD and Delivery

### Confirmed requirements

- CI platform: GitHub Actions.
- Branching: short-lived feature branches with pull requests and a protected `main` branch.
- Environments: local, development, staging, and production.
- Deployment: rolling deployments initially; reserve blue/green or canary deployment for higher-risk changes later.
- Promotion: deploy automatically to development, then manually promote to staging and production with approvals.
- CI checks: include linting, formatting checks, typechecking, unit tests, integration tests, E2E tests, OpenAPI validation, dependency scanning, secret scanning, SAST, container scanning, IaC scanning, SBOM generation, image signing, and artifact publishing.
- Migrations: run as separate controlled migration jobs with expand-and-contract compatibility, tenant-by-tenant rollout, monitoring, pause controls, and recovery procedures.
- Rollback: support application rollback; use forward-compatible corrective database migrations rather than relying on destructive down-migrations.

### Learning-oriented explanations

- CI means Continuous Integration: every pull request is automatically checked so problems are found before merging. CD means Continuous Delivery or Deployment: approved changes are packaged and moved through environments in a repeatable way.
- A pull request is a proposed change reviewed before it enters `main`. A protected branch prevents direct unreviewed changes and can require tests to pass.
- Development is for fast feedback, staging is a production-like rehearsal environment, and production serves real users. Local development remains independent and safe for experimentation.
- A rolling deployment replaces application instances gradually. This usually avoids a full outage, but old and new versions must temporarily work together.
- An SBOM, or Software Bill of Materials, is a machine-readable inventory of the libraries and system components inside an artifact. It helps identify affected software when a vulnerability is announced.
- Image signing attaches verifiable proof that a container image came from the trusted build pipeline and was not replaced. The deployment platform can later require trusted signatures.
- An artifact is a build output such as a container image, generated client package, or migration bundle. Publishing it once and promoting the same artifact reduces environment differences.
- Expand-and-contract migrations first add changes that old and new application versions can both understand, then remove obsolete structures only after the new version is stable. This is safer than changing the database incompatibly during a rolling deployment.
- Forward-compatible recovery means repairing a schema or data problem with a new migration rather than assuming every production database can safely reverse a completed migration.

### Risk notes

- Production approvals and signing keys are security-sensitive controls. They should be protected with least privilege, audit trails, and separate responsibilities where practical.
- Rolling deployments require API, worker, WebSocket, and database compatibility across versions. Migration jobs must complete in a controlled sequence.
- A database rollback can destroy or misinterpret data. Recovery plans need backups, tested restore procedures, and forward fixes rather than blind reversal.

## Batch 9 Decision Log

- Confirmed: use GitHub Actions.
- Confirmed: use short-lived feature branches, pull requests, and protected `main`.
- Confirmed: use local, development, staging, and production environments.
- Confirmed: use rolling deployments initially.
- Confirmed: automatically deploy to development and manually promote to staging and production.
- Confirmed: include the recommended build, test, security, SBOM, signing, and artifact checks.
- Confirmed: use separate controlled migration jobs with tenant-by-tenant rollout.
- Confirmed: use application rollback and forward-compatible database recovery migrations.

Recommendations remain proposals until explicitly confirmed by the user.

## Batch 8 - Testing and Quality

### Confirmed requirements

- Test strategy: use unit, integration, and end-to-end tests as a testing pyramid.
- Coverage: use different targets by layer, with especially strong coverage for authorization, tenant isolation, clinical rules, migrations, and security-sensitive code. Coverage is a signal, not proof of quality.
- Integration infrastructure: use Testcontainers with real PostgreSQL and Redis dependencies.
- Contract testing: begin with OpenAPI validation; add Pact consumer-driven contracts when independently deployed clients or external integrations justify it.
- Web end-to-end testing: use Playwright, including Arabic, English, RTL, and role-based access workflows.
- Mobile end-to-end testing: add Detox or the selected React Native-compatible tooling when mobile workflows are implemented.
- Quality tools: enforce ESLint, Prettier, TypeScript strict mode, dependency/security checks, Husky, and lint-staged from the beginning.
- Isolation and authorization tests: cover cross-tenant access, subdomain tampering, patient-record boundaries, staff permissions, suspended users and tenants, sensitive audit events, protected file downloads, and WebSocket tenant/role boundaries.
- Test data: use generated synthetic IVF data only, including Arabic and English names, RTL content, multiple tenants and roles, consent states, appointments, clinical records, and file metadata.

### Learning-oriented explanations

- A unit test checks one small piece of code in isolation and runs quickly. Example: verify that a permission rule rejects a receptionist attempting an operation reserved for a doctor.
- An integration test checks that several real pieces work together. Example: verify that the API, PostgreSQL tenant database, and authorization layer cannot return another tenant’s record.
- An end-to-end test follows a complete user journey through the running system. Example: sign in as a clinic user, open a patient record, create an appointment, and confirm the audit event.
- The testing pyramid means many fast unit tests at the base, fewer integration tests in the middle, and a small number of slower end-to-end tests at the top.
- Code coverage measures which code paths tests executed. High coverage does not guarantee useful assertions, so security and business-behavior tests matter more than a single percentage.
- Testcontainers starts temporary real dependency containers during tests. This catches database and Redis behavior that an in-memory mock could hide.
- OpenAPI validation checks that implementation and clients follow the documented API shape. Pact tests the expectations between a consumer, such as the mobile app, and a provider, such as the API.
- Playwright automates a real browser. It will help verify authentication, tenant routing, permissions, Arabic/English rendering, RTL layout, and important workflows.
- Synthetic data is fictional data generated for testing. It must look realistic enough to find bugs without containing real patient information.

### Risk notes

- Tests that use real databases and containers are more reliable but slower and require careful cleanup and deterministic fixtures.
- Authorization tests are security controls, not optional quality extras. A passing functional test suite does not prove tenant isolation unless isolation is tested directly.
- Mobile E2E testing can be expensive in CI. Start with a focused critical-path suite and expand it as mobile workflows stabilize.

## Batch 8 Decision Log

- Confirmed: use unit, integration, and end-to-end tests.
- Confirmed: use layer-specific coverage targets with stronger expectations for security-sensitive behavior.
- Confirmed: use Testcontainers with real PostgreSQL and Redis dependencies.
- Confirmed: use OpenAPI validation initially and add Pact when integration boundaries justify it.
- Confirmed: use Playwright for web E2E tests and add React Native-compatible mobile E2E tooling later.
- Confirmed: enforce ESLint, Prettier, TypeScript strict mode, security checks, Husky, and lint-staged.
- Confirmed: test tenant isolation, authorization boundaries, audit behavior, protected files, and WebSocket access.
- Confirmed: use synthetic multilingual IVF data only.

Recommendations remain proposals until explicitly confirmed by the user.

## Working constraints

- This file is a planning record, not implementation.
- Do not commit changes unless explicitly requested.
- Keep project-specific decisions and follow-up context in this folder as the project evolves.
- Learning mode: explain unfamiliar technologies, acronyms, architecture patterns, and security controls in plain language as they are introduced. For each important choice, include what it is, why it is needed here, a small concrete example, and the main trade-off. Do not assume prior professional experience.

## Batch 6 - API, Gateway and Observability

### Confirmed requirements

- Gateway/reverse proxy: Traefik for local Compose and Kubernetes ingress, with the application kept independent from the gateway.
- API versioning: URL versioning with `/api/v1/...`.
- Error format: RFC 9457 Problem Details with stable application error codes and correlation IDs.
- Pagination: cursor pagination for clinical and high-volume resources; offset pagination for small administrative lists.
- Idempotency: required for retry-sensitive commands such as tenant provisioning, exports, financial or appointment-related operations, and external integrations.
- Rate limiting: layered limits by tenant, authenticated user or OAuth client, and IP for anonymous endpoints.
- Observability: OpenTelemetry with Prometheus, Grafana, Loki, and Tempo as the provider-neutral baseline.
- Audit and telemetry: structured JSON logs, correlation IDs, trace IDs, tenant context, clinical access audit events, authentication and authorization audit events, immutable audit storage, and initial SLOs for availability, latency, and background jobs.

### Proposed defaults awaiting confirmation

- API errors: never expose stack traces or sensitive clinical data; include a stable error code, human-safe detail, correlation ID, and trace context where appropriate.
- Rate limits: enforce limits at the gateway for coarse protection and in the application for tenant-, user-, client-, and workflow-aware rules. Return standard retry metadata.
- Metrics: define names and labels centrally, avoid high-cardinality patient or request labels, and include API latency, error rate, saturation, job throughput, job age, migration status, tenant provisioning, database health, and WebSocket connections.
- Audit storage: make audit records append-only to the application, restrict deletion to a controlled retention process, protect storage from ordinary tenant administrators, and record actor, tenant, subject, action, outcome, timestamp, request/correlation ID, and reason where required.
- SLO starting point: use provisional targets of 99.9% monthly API availability, p95 REST latency below 500 ms for ordinary reads/writes, and background jobs beginning within 60 seconds. Validate these against real IVF workflows before treating them as contractual.
- Trace propagation: propagate W3C trace context through REST, WebSockets, BullMQ jobs, outbox processing, database calls where supported, and external adapters.
- Health endpoints: separate liveness, readiness, dependency health, and startup checks; do not expose sensitive dependency details publicly.

### Risk notes

- Clinical access auditing and immutable audit storage may be regulatory requirements, but retention, administrator visibility, export, and legal-hold behavior must be defined per deployment jurisdiction.
- Tenant IDs, user IDs, clinical resource identifiers, and trace attributes can become sensitive or high-cardinality data. Logging and metrics policies must prevent accidental disclosure and telemetry overload.
- WebSocket connections require tenant-aware authentication, authorization, reconnect handling, rate limits, and auditability equivalent to REST.

## Batch 6 Decision Log

- Confirmed: use Traefik as the initial gateway/reverse proxy.
- Confirmed: use URL API versioning with `/api/v1/...`.
- Confirmed: use RFC 9457 Problem Details and stable application error codes.
- Confirmed: use cursor pagination for high-volume clinical resources and offset pagination for small administrative lists.
- Confirmed: require idempotency keys for retry-sensitive operations.
- Confirmed: apply layered rate limits by tenant, user/client, and IP where applicable.
- Confirmed: use OpenTelemetry, Prometheus, Grafana, Loki, and Tempo.
- Confirmed: include structured logs, correlation and trace IDs, tenant context, clinical/authentication/authorization audit events, immutable audit storage, and provisional SLOs.
- Proposed: start with 99.9% monthly API availability, p95 latency below 500 ms, and background jobs starting within 60 seconds, subject to workflow and load-test validation.

Recommendations remain proposals until explicitly confirmed by the user.

## Batch 7 - Security

### Confirmed requirements

- Security target: OWASP ASVS Level 2 for the platform, with Level 3 protections for authentication, authorization, clinical data, file handling, and audit modules.
- Encryption: encrypt tenant databases, backups, object storage, and network traffic using TLS.
- Application-level encryption: encrypt selected especially sensitive clinical fields in addition to infrastructure/database encryption.
- CI security scanning: include dependency scanning, secret scanning, SAST, container scanning, IaC scanning, and DAST once a staging environment exists.
- Threat modeling: perform it before production and whenever major trust boundaries change.
- Penetration testing: perform it before production, annually, and after major security-sensitive changes.
- Browser/API security: enforce strict CORS allowlists, CSP, HSTS, secure headers, CSRF protection where cookie sessions exist, request validation, output encoding, SSRF protections, secure file uploads, and controlled WebSocket origins.
- Audit separation: retain security and clinical audit events separately from ordinary application logs in tamper-resistant, access-controlled storage.

### Learning-oriented explanations

- OWASP ASVS is a checklist for verifying that an application has implemented important security controls. Level 2 is an appropriate practical baseline for a system handling sensitive clinical data; Level 3 adds stronger controls for the most sensitive parts.
- Encryption at rest protects stored data if storage media or backups are accessed. TLS protects data while it travels between clients, services, databases, and storage.
- Application-level encryption protects selected values even from some infrastructure-level readers, but it makes searching, reporting, key rotation, backups, and recovery more complex.
- SAST examines source code for likely security mistakes. Dependency scanning checks third-party packages. Secret scanning looks for accidentally committed credentials. Container and IaC scanning inspect images and infrastructure definitions. DAST tests a running deployed application from the outside.
- Threat modeling is a structured exercise that asks what can go wrong at each trust boundary, such as a mobile client, gateway, Keycloak, API, worker, tenant database, or object storage.
- Penetration testing is an authorized security assessment that attempts to exploit weaknesses so they can be fixed before attackers find them.
- CSP limits which scripts and resources a browser may load. CORS controls which browser origins may call the API. HSTS tells browsers to use HTTPS. CSRF protection prevents a malicious site from causing actions through an authenticated browser session. SSRF protection prevents the server from being tricked into calling internal services.
- Tamper-resistant audit storage preserves evidence of who accessed or changed sensitive data. Ordinary operational logs are optimized for debugging and should not be treated as a clinical audit record.

### Risk notes

- ASVS levels are engineering targets, not legal certifications. HIPAA, Egyptian requirements, and other country-specific obligations still require qualified legal and compliance review.
- Application-level encryption requires a key-management design before production: key ownership, rotation, backup, emergency recovery, separation of duties, and access auditing must be defined.
- DAST and penetration testing require a safe, isolated environment and test data; real patient data must never be used for security testing.

## Batch 7 Decision Log

- Confirmed: use ASVS Level 2 as the platform baseline and Level 3 protections for sensitive modules.
- Confirmed: encrypt stored data, backups, object storage, and network traffic.
- Confirmed: use application-level encryption selectively for especially sensitive clinical fields.
- Confirmed: run dependency, secret, SAST, container, IaC, and staging DAST scans.
- Confirmed: perform threat modeling before production and after major trust-boundary changes.
- Confirmed: perform penetration testing before production, annually, and after major security-sensitive changes.
- Confirmed: enforce the recommended browser, API, upload, SSRF, CSRF, CORS, CSP, HSTS, and WebSocket-origin controls.
- Confirmed: keep security and clinical audit events in separate tamper-resistant storage.
- Confirmed: explain the project’s technologies and decisions as part of the learning workflow.

Recommendations remain proposals until explicitly confirmed by the user.

## Batch 10 - Developer Experience and Documentation

### Confirmed requirements

- First-run target: complete local environment in under 10 minutes, with a faster minimal mode.
- Documentation: include a root README, quick-start guide, architecture guide, technical glossary, ADRs, OpenAPI documentation, local development guide, testing guide, deployment guide, security guide, operations/runbooks, troubleshooting guide, and contribution guide.
- Architecture Decision Records: use ADRs to document important choices, alternatives, consequences, and dates.
- Initial ADR topics: modular monolith, database-per-tenant, Keycloak/OIDC, NestJS with future Python workers, PostgreSQL plus Redis/BullMQ, REST/OpenAPI, Arabic-first internationalization, Kubernetes readiness, compliance/jurisdiction profiles, and clinical-data protection/auditing.
- API documentation: treat a reviewed and versioned OpenAPI contract as the public interface and generate clients/validation from it where practical.
- Initial runbooks: local startup/shutdown, tenant provisioning, tenant migrations, backup/restore, Keycloak administration, secret rotation, incident response, security events, audit export, failed-job recovery, rollback/release recovery, tenant offboarding, and data destruction.
- Sample slices: begin with a small `Projects` or `Clinic Tasks` slice, then add a carefully scoped IVF workflow such as patient registration and appointment scheduling.
- Documentation audiences: support the primary learner/maintainer, future contributors, client technical teams, and operations/security teams through separate documentation paths.

### Learning-oriented explanations

- An ADR is a short historical record explaining why a significant technical decision was made. It prevents future confusion and makes alternatives visible.
- OpenAPI is a machine-readable description of the REST API. It can generate documentation, client libraries, and validation so the web app, mobile app, and backend agree on request and response shapes.
- A runbook is a step-by-step operational procedure. For example, a tenant provisioning runbook explains how to create a tenant safely, verify its database, and confirm its audit trail.
- A vertical slice is a small feature implemented through every relevant layer, from UI and API to application logic, persistence, authorization, tests, and observability. It demonstrates the architecture better than isolated technical examples.
- A glossary is especially important for this project because terms such as tenant, OIDC, migration, outbox, SLO, RLS, and idempotency will appear throughout the implementation.

### Risk notes

- A full documentation set can become stale. Documentation checks and ownership should be part of pull requests, especially for API contracts, runbooks, and security behavior.
- A clinical sample slice must use synthetic data and carefully bounded workflows; it must not accidentally become an unreviewed medical-legal design.

## Batch 10 Decision Log

- Confirmed: target a complete local first run under 10 minutes with a minimal mode.
- Confirmed: provide the recommended documentation set and a technical glossary.
- Confirmed: use ADRs for major architecture, security, compliance, and operational decisions.
- Confirmed: use a reviewed, versioned OpenAPI contract with generated clients and validation where practical.
- Confirmed: provide the recommended operational, security, deployment, backup, recovery, and tenant-lifecycle runbooks.
- Confirmed: start with a small safe sample slice, followed by a limited IVF workflow.
- Confirmed: document the system for learners, contributors, clients, and operators.

Recommendations remain proposals until explicitly confirmed by the user.
