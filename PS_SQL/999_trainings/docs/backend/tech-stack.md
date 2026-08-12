# Backend Tech Stack

Phase 2 uses this stack as the implementation baseline for the backend API layer.

- Runtime: Node.js
- Framework: Express
- ORM: Prisma
- Native SQL: Supported via Prisma `$queryRaw` and separate `.sql` files

## Notes

- Express is the preferred starting point for a minimal REST API surface.
- Keep the stack lean until the first backend slice is validated.
- Introduce additional libraries only when a Phase 2 requirement needs them.
