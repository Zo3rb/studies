# System Architecture

## High-Level Overview

- **Frontend**: React (SPA)
- **Backend**: Node.js (REST API with Prisma + raw SQL support)
- **Database**: PostgreSQL (`trainings`)
- **Analytics/ML Layer**: Python scripts consuming data from PostgreSQL
- **Deployment**: (to be decided in later phases)

## Design Principles

- Documentation-first
- Prefer the right PostgreSQL data type for integrity & performance
- Support both Prisma and native SQL
- Keep AI/ML layer separate but integrated via data exports
