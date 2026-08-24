#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR/docker"

docker compose up -d

echo "Waiting for SonarQube..."
for _ in {1..60}; do
  if curl -fsS http://localhost:9000/api/system/status | grep -q '"status":"UP"'; then
    echo "SonarQube is operational at http://localhost:9000"
    exit 0
  fi
  sleep 5
done

echo "SonarQube did not become operational in time." >&2
docker compose logs --tail=80 sonarqube >&2 || true
exit 1
