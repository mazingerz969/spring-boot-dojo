#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="${ROOT}/.env.production"
SQL_FILE="${ROOT}/db/seed-demo-ranking.sql"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "No se encontró .env.production en $ROOT"
  exit 1
fi

# shellcheck disable=SC1090
source "$ENV_FILE"

CONTAINER="$(docker compose -f "$ROOT/docker-compose.prod.yml" ps -q postgres)"

if [[ -z "$CONTAINER" ]]; then
  echo "El contenedor postgres no está en marcha."
  echo "Levanta el stack: docker compose -f docker-compose.prod.yml --env-file .env.production up -d"
  exit 1
fi

docker exec -i "$CONTAINER" psql -U dojo -d dojo < "$SQL_FILE"

echo ""
echo "Datos demo insertados."
echo "Usuarios (password: demo1234):"
echo "  sensei_akira, dev_maria, spring_ninja, java_samurai, bean_master,"
echo "  boot_pupil, jpa_wizard, kata_rookie, api_guru, dojo_newbie"
