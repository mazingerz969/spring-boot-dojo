#!/bin/bash
set -e

: "${DB_PASSWORD:?Export DB_PASSWORD before running (openssl rand -base64 32)}"

echo "=== Spring Dojo: PostgreSQL Setup ==="

# 1. Fix pg_hba.conf
echo "[1/5] Configuring pg_hba.conf..."
cat > /var/lib/pgsql/data/pg_hba.conf <<'EOF'
local   all   postgres   peer
local   all   all   md5
host    all   all   127.0.0.1/32   md5
host    all   all   ::1/128   md5
local   replication   all   peer
host    replication   all   127.0.0.1/32   md5
host    replication   all   ::1/128   md5
EOF
echo "   Done."

# 2. Restart PostgreSQL
echo "[2/5] Restarting PostgreSQL..."
systemctl restart postgresql
sleep 2
echo "   Done."

# 3. Create user and databases
echo "[3/5] Creating user and databases..."
DB_PASSWORD_SQL="${DB_PASSWORD//\'/\'\'}"
su -c "psql -v ON_ERROR_STOP=0" - postgres <<SQL
DO \$\$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname='dojo') THEN
    CREATE USER dojo WITH PASSWORD '${DB_PASSWORD_SQL}';
    RAISE NOTICE 'User dojo created';
  ELSE
    RAISE NOTICE 'User dojo already exists';
  END IF;
END \$\$;

SELECT 'CREATE DATABASE dojo_auth OWNER dojo' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname='dojo_auth')\\gexec
SELECT 'CREATE DATABASE dojo_content OWNER dojo' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname='dojo_content')\\gexec
SELECT 'CREATE DATABASE dojo_progress OWNER dojo' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname='dojo_progress')\\gexec

GRANT ALL PRIVILEGES ON DATABASE dojo_auth TO dojo;
GRANT ALL PRIVILEGES ON DATABASE dojo_content TO dojo;
GRANT ALL PRIVILEGES ON DATABASE dojo_progress TO dojo;
SQL
echo "   Done."

# 4. Grant schema permissions
echo "[4/5] Granting schema permissions..."
for DB in dojo_auth dojo_content dojo_progress; do
  su -c "psql -d $DB -v ON_ERROR_STOP=0" - postgres <<SQL
    GRANT ALL ON SCHEMA public TO dojo;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO dojo;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO dojo;
SQL
done
echo "   Done."

# 5. Verify
echo "[5/5] Verifying..."
su -c "psql -c \"SELECT datname FROM pg_database WHERE datname LIKE 'dojo_%';\"" - postgres

echo ""
echo "=== Setup complete! ==="
echo "Test with: PGPASSWORD=\"\$DB_PASSWORD\" psql -U dojo -h localhost -d dojo_auth"
