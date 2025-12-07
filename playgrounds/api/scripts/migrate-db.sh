#!/bin/bash
echo "🙏 Executing migration for PostgreSQL";

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
migration_dir="$script_dir/../internal/infrastructure/db/migrations";

if [ -f "$migration_dir/0001_init.up.sql" ]; then
        echo "✅ Migration files found"; 

        docker run --rm \
            -v "$migration_dir":/migrations \
            --network modern-lms_modern-lms-net \
            migrate/migrate:4 \
            -path=/migrations/ \
            -database postgres://postgres:postgres.fikridev@host.docker.internal:5432/modern-lms-postgres?sslmode=disable up;

        echo "✅ Migration succeeded"; 
else 
    echo "❌ No migration files found"; 
fi