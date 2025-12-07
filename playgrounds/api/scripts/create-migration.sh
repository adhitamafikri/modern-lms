#!/bin/bash

if [ -z "${NAME:-}" ]; then
  echo "❌ NAME argument is needed"
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
migration_dir="$script_dir/../internal/infrastructure/db/migrations";

echo "⏳ Creating migration files for ${NAME}"

# migrate create -ext sql -dir $(PWD)/playgrounds/api/migrations -seq $NAME
docker run --rm \
    -v "$migration_dir":/migrations \
    --network modern-lms_modern-lms-net \
    migrate/migrate:4 \
    create -ext sql -dir /migrations -seq ${NAME};

echo "✅ Successfully created migration files for ${NAME}"
