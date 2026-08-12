# Recommended PostgreSQL Extensions

- `pgcrypto` → required for `gen_random_uuid()` and other crypto helpers used by the schema
- `pg_trgm` → optional, for future fuzzy text search and similarity matching
- `pgvector` → future, for AI embeddings and semantic search workloads

Phase 1 now treats `pgcrypto` as the baseline extension. The other extensions remain optional until the corresponding backend/search/AI requirements are finalized.
