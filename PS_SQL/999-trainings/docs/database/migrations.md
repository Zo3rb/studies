# Migration Strategy

- Use Prisma migrations for the main schema
- Store native SQL migration files in `/sql/migrations/`
- Always run migrations in a transaction
- Document every migration with a clear description
- Phase 1 cleanup uses transactional SQL to fix broken foreign key references, repair init-script DDL, and harden indexes without breaking existing schema intent
- Use `sql/init/000_master.sql` as the single orchestrator for full schema bootstrap in dependency-safe order
- Use `sql/init/000_master_drop_recreate.sql` for local destructive reset (drop/recreate `public` schema, then run full bootstrap)
- Prisma ORM v7+ connection URLs are configured in `prisma.config.ts` (not in `schema.prisma`)
