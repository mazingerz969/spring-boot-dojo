#!/usr/bin/env bash
# Despliegue rápido en producción
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ ! -f .env.production ]]; then
  echo "Crea .env.production desde .env.production.example"
  exit 1
fi

docker network create portfolio-net 2>/dev/null || true

docker compose -f docker-compose.prod.yml --env-file .env.production up -d --build "$@"

echo ""
echo "Desplegado. Comprueba:"
echo "  docker compose -f docker-compose.prod.yml ps"
echo "  docker compose -f docker-compose.prod.yml logs -f backend"
