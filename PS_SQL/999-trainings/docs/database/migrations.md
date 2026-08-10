# Migration Strategy

- Use Prisma migrations for ongoing schema evolution after the Phase 2 v1.1 baseline
- Store native SQL migration files in `sql/migrations/`
- Keep the init scripts in `sql/init/` as the bootstrap path for a clean database build
- Always run migrations in a transaction when the change set allows it
- Document every migration with a clear description and rollback expectation
- The clean bootstrap scripts are for an empty database only. Never run them as an upgrade path for populated data.
- Use the shell wrappers in `sql/init/bootstrap.sh` and `sql/init/reset.sh` as the command-line entrypoints for full bootstrap and local destructive reset
- The individual files in `sql/init/` are plain SQL and can be executed directly in DBeaver in dependency order
- The bootstrap order is `001_extensions.sql`, `002_schema.sql`, `003_rls.sql`, then `004_seed_platform_roles.sql`.
- Prisma ORM v7+ connection URLs are configured in `prisma.config.ts` (not in `schema.prisma`)
