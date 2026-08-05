# Backend Best Practices

Phase 2 backend work should follow these defaults.

- Always use parameterized queries
- Prefer Prisma for CRUD, raw SQL for complex reporting
- Consistent error handling & logging

## Phase 2 Rules

- Return a single error shape for all API failures.
- Keep handlers small and move cross-cutting logic into shared middleware.
- Validate inputs before calling Prisma or raw SQL.
- Treat authentication and authorization as separate concerns.
- Add tests for every endpoint group that becomes part of the first backend slice.
