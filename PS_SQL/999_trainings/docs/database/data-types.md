# PostgreSQL Data Types Reference

**For the trainings Database & Knowledge-Testing Full-Stack System**  
_Documented for Software Engineering, Data Analysis, AI/ML Workflows_  
_Prepared by a 20-year veteran Software Engineer & Data Scientist_

This README serves as living documentation for the trainings PostgreSQL database. It catalogs **all built-in general-purpose data types** (per PostgreSQL 18 official docs), with practical examples tailored to a full-stack training/knowledge-testing platform.

The system enables:

- User management, course cataloging, progress tracking, quiz attempts, and certification.
- Full-stack development from scratch (e.g., FastAPI/Node backend + React/Vue frontend + reporting layer).
- Data analysis dashboards.
- AI/ML pipelines (feature stores, embeddings, model metadata, JSON configs).

Examples assume a schema like:

sql

```sql
CREATE DATABASE trainings;
-- Core tables: users, courses, enrollments, quiz_attempts, reports, ml_features, etc.
```

## Key Principles (from 20 years experience)

- Use the most precise type for data integrity, performance, and query speed.
- Leverage PostgreSQL’s rich types (JSONB, arrays, ranges, tsvector) to reduce app-layer complexity.
- For AI/ML: arrays/JSONB for vectors/embeddings, timestamps for time-series features, UUIDs for distributed systems.
- Reporting: heavy use of timestamps, numerics, and JSONB for flexible analytics.

### 1. Numeric Types

Used for IDs, scores, prices, counts, ML metrics (accuracy, loss), and financial aspects (subscriptions).

- smallint / int2, integer / int4, bigint / int8
- smallserial / serial2, serial / serial4, bigserial / serial8
- numeric / decimal(p,s), real / float4, double precision / float8

**Examples in trainings**:

sql

```sql
CREATE TABLE courses (
    id bigserial PRIMARY KEY,
    price numeric(10,2),           -- e.g., 49.99
    duration_minutes integer,      -- 120
    avg_rating real                -- ML feature: 4.7
);

-- Progress & ML scoring
CREATE TABLE quiz_attempts (
    score numeric(5,2),            -- 87.50
    attempt_number serial
);
```

**Contexts**: SE (auto-increment PKs), Data Analysis (aggregates like SUM(price)), AI/ML (feature normalization with double precision).

### 2. Monetary Type

- money

**Example**:

sql

```sql
ALTER TABLE courses ADD COLUMN subscription_cost money;
```

**Contexts**: Subscription billing in full-stack apps; currency-aware reporting.

### 3. Character Types

- character(n) / char(n), character varying(n) / varchar(n), text

**Examples**:

sql

```sql
CREATE TABLE users (
    email varchar(255) UNIQUE NOT NULL,
    bio text,                      -- Long-form profile for NLP/ML
    name char(50)
);
```

**Contexts**: SE (validation), Data Analysis (string ops), AI/ML (text features for embeddings/NLP).

### 4. Binary Data Types

- bytea

**Example**:

sql

```sql
CREATE TABLE user_avatars (
    avatar bytea
);
```

**Contexts**: Storing images/PDF certificates; efficient for full-stack file uploads.

### 5. Date/Time Types

- date, time[(p)] [without time zone], time[(p)] with time zone / timetz
- timestamp[(p)] [without time zone], timestamp[(p)] with time zone / timestamptz
- interval [fields] [(p)]

**Examples** (critical for reporting & time-series ML):

sql

```sql
CREATE TABLE enrollments (
    enrolled_at timestamptz DEFAULT now(),
    completed_at timestamptz,
    study_duration interval
);
```

**Contexts**: SE (audit logs), Data Analysis (cohort analysis), AI/ML (temporal features, session duration).

### 6. Boolean Type

- boolean / bool

**Example**:

sql

```sql
ALTER TABLE users ADD COLUMN is_premium boolean DEFAULT false;
```

**Contexts**: Feature flags, ML binary labels.

### 7. Enumerated Types (User-Defined)

- enum (via CREATE TYPE)

**Example**:

sql

```sql
CREATE TYPE difficulty_level AS ENUM ('beginner', 'intermediate', 'advanced');
ALTER TABLE courses ADD COLUMN level difficulty_level;
```

**Contexts**: Controlled vocabularies for UX and ML classification.

### 8. Geometric Types

- point, line, lseg, box, path, polygon, circle

**Example** (rarely used but available for spatial analytics):

sql

```sql
-- Hypothetical: course location heatmap
ALTER TABLE training_locations ADD COLUMN coords point;
```

### 9. Network Address Types

- inet, cidr, macaddr, macaddr8

**Example**:

sql

```sql
ALTER TABLE audit_logs ADD COLUMN ip_address inet;
```

**Contexts**: Security logging in full-stack apps.

### 10. Bit String Types

- bit(n), bit varying(n) / varbit(n)

**Example**:

sql

```sql
ALTER TABLE feature_flags ADD COLUMN permissions bit(8);
```

### 11. Text Search Types

- tsvector, tsquery

**Example** (full-text search on course content):

sql

```sql
ALTER TABLE courses ADD COLUMN content_tsv tsvector;
CREATE INDEX idx_content_search ON courses USING GIN(content_tsv);
```

**Contexts**: Search in training platform; AI semantic search prep.

### 12. UUID Type

- uuid

**Example** (distributed systems / microservices):

sql

```sql
CREATE TABLE users (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid()
);
```

### 13. XML Type

- xml

**Example** (legacy integrations):

sql

```sql
ALTER TABLE exports ADD COLUMN metadata xml;
```

### 14. JSON Types

- json, jsonb (preferred), jsonpath

**Examples** (core for flexible schemas & ML configs):

sql

```sql
CREATE TABLE ml_models (
    hyperparameters jsonb,         -- {"learning_rate": 0.01, "epochs": 100}
    embeddings float8[]            -- Array of vectors for similarity search
);

CREATE TABLE quiz_attempts (
    answers jsonb                  -- {"q1": "A", "q2": true}
);
```

**Contexts**: AI/ML model metadata & feature stores; flexible reporting.

### 15. Arrays (of any base type)

- type[]

**Example** (ML feature vectors, multi-select skills):

sql

```sql
ALTER TABLE users ADD COLUMN skill_tags text[];
ALTER TABLE ml_features ADD COLUMN embedding vector(768);  -- or float8[]
```

**Contexts**: AI embeddings, tagging systems.

### 16. Composite Types (User-Defined)

- Custom row types via CREATE TYPE ... AS

**Example**:

sql

```sql
CREATE TYPE address AS (street text, city text, zip varchar(10));
ALTER TABLE users ADD COLUMN billing_address address;
```

### 17. Range Types

- int4range, int8range, numrange, tsrange, tstzrange, daterange, plus multirange variants

**Example** (course validity windows):

sql

```sql
ALTER TABLE courses ADD COLUMN validity_range daterange;
```

### 18. Domain Types

- Custom constrained types via CREATE DOMAIN

**Example**:

sql

```sql
CREATE DOMAIN positive_score AS numeric(5,2) CHECK (VALUE >= 0 AND VALUE <= 100);
```

### 19. Object Identifier & Pseudo-Types

- oid, reg\* types, pg_lsn, pg_snapshot, pseudo-types (any, anyelement, etc.)

These are mostly internal or for advanced extensions (not typically used for columns).
