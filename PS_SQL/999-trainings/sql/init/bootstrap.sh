#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
: "${DATABASE_URL:?DATABASE_URL is required}"

for sql_file in \
  001_extensions.sql \
  002_schema.sql \
  003_rls.sql \
  004_seed_platform_roles.sql
  do
  psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f "$script_dir/$sql_file"
done
