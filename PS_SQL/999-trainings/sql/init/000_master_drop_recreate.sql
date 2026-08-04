-- Start Here. 
-- Please Run this: psql "$DATABASE_URL" -f sql/init/000_master_drop_recreate.sql
\
set ON_ERROR_STOP on -- trainings-platform local destructive reset (Phase 1)
    -- Run with:
    --   psql "$DATABASE_URL" -f sql/init/000_master_drop_recreate.sql
    --
-- WARNING:
    -- - This will permanently remove all objects/data in the current DB's public schema.
    -- - Intended for local development resets only.
    BEGIN;
SET client_min_messages TO WARNING;
SET lock_timeout TO '10s';
SET statement_timeout TO '0';
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
COMMIT;
\ ir 000_master.sql