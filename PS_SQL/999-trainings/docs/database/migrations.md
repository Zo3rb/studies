# Migration Strategy

- Use Prisma migrations for ongoing schema evolution after the Phase 1 baseline
- Store native SQL migration files in `sql/migrations/`
- Keep the init scripts in `sql/init/` as the bootstrap path for a clean database build
- Always run migrations in a transaction when the change set allows it
- Document every migration with a clear description and rollback expectation
- Phase 1 cleanup is complete and covers transactional SQL fixes for foreign key references, repaired init-script DDL, and schema-safe bootstrapping
- Use the shell wrappers in `sql/init/bootstrap.sh` and `sql/init/reset.sh` as the command-line entrypoints for full bootstrap and local destructive reset
- The individual files in `sql/init/` are plain SQL and can be executed directly in DBeaver in dependency order
- Keep `sql/init/000_master.sql` and `sql/init/000_master_drop_recreate.sql` as human-readable bootstrap manifests for the documented execution order
- Prisma ORM v7+ connection URLs are configured in `prisma.config.ts` (not in `schema.prisma`)
