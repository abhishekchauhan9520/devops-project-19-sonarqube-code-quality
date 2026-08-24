#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT_DIR/docker/docker-compose.yml"
grep -q 'sonarqube:26.8.0.126808-community' "$ROOT_DIR/docker/docker-compose.yml"
grep -q 'postgres:17-alpine' "$ROOT_DIR/docker/docker-compose.yml"
grep -q 'SONAR_JDBC_URL' "$ROOT_DIR/docker/docker-compose.yml"
grep -q 'condition: service_healthy' "$ROOT_DIR/docker/docker-compose.yml"
test -f "$ROOT_DIR/projects/java-sample/pom.xml"
test -f "$ROOT_DIR/projects/node-sample/package.json"
test -f "$ROOT_DIR/projects/node-sample/test.js"
grep -q 'sonar.token' "$ROOT_DIR/scripts/run_sonar_scanner_java.sh"
grep -q 'sonar.token' "$ROOT_DIR/scripts/run_sonar_scanner_node.sh"
! grep -R '|| true' "$ROOT_DIR/.github" >/dev/null

echo "Project 19 structure and CI safety checks passed."
