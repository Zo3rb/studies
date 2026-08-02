# Migration Strategy

- Use Prisma migrations for the main schema
- Store native SQL migration files in `/sql/migrations/`
- Always run migrations in a transaction
- Document every migration with a clear description
