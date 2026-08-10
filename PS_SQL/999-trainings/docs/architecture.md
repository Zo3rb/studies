# System Architecture

## High-Level Overview

- **Frontend**: React SPA (future `apps/web` workspace)
- **Backend**: TypeScript Node.js REST API with Express, Prisma, and raw SQL support (future `apps/api` workspace)
- **Database**: PostgreSQL (`trainings`), shared-schema multi-tenant model with tenant isolation
- **Analytics/ML Layer**: Python scripts consuming data from PostgreSQL
- **Deployment**: Docker Compose for local development; portable Docker services for staging and production

## Design Principles

- Documentation-first
- Prefer the right PostgreSQL data type for integrity & performance
- Support both Prisma and native SQL
- Keep AI/ML layer separate but integrated via data exports
- Enforce tenant isolation in both application authorization and PostgreSQL Row-Level Security
- Keep production services stateless, containerized, observable, and configured only through environment-specific secrets
