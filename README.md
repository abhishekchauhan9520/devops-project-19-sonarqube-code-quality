# Project 19 — Automated Code Quality Checks with SonarQube

A reproducible DevOps lab for running SonarQube Community Build locally and scanning Java and Node.js sample projects from CLI, Jenkins, and GitHub Actions.

## Architecture

```text
Java sample ─┐
             ├── SonarScanner ──> SonarQube ──> PostgreSQL
Node sample ─┘
```

## Repository layout

- `docker/` — local SonarQube + PostgreSQL stack
- `projects/java-sample/` — Maven Java sample
- `projects/node-sample/` — Node.js sample
- `scripts/` — start/stop and scan helpers
- `jenkins/Jenkinsfile` — Jenkins pipeline
- `.github/workflows/sonar-scan.yml` — GitHub Actions
- `tests/test_project.sh` — offline repository/CI checks

## Local setup

Requirements: Docker Compose, curl, Java/Maven for the Java sample, Node.js for the Node sample, and a SonarScanner CLI.

```bash
./scripts/start_sonarqube.sh
```

Open `http://localhost:9000`, create a token, then:

```bash
export SONAR_TOKEN='...'
export SONAR_HOST_URL='http://localhost:9000'

./scripts/run_sonar_scanner_node.sh
./scripts/run_sonar_scanner_java.sh
```

## GitHub Actions

The workflow always runs the Node and Java unit tests.

Sonar analysis runs only when both repository secrets are configured:

- `SONAR_HOST_URL`
- `SONAR_TOKEN`

Scanner failures are not suppressed.

## Jenkins

Create Jenkins secret-text credentials named:

- `sonar-host`
- `sonar-token`

Then run the included pipeline. Credentials are injected only inside the analysis stage.

## Operational notes

The Docker image is pinned to `sonarqube:26.8.0.126808-community`, and PostgreSQL is pinned to `17-alpine`. SonarQube currently supports PostgreSQL 14–18 for Community Build. SonarQube also has host requirements for Linux/Docker deployments; see the official documentation before using this beyond a lab.

The included `sonar/sonar` database credentials are intentionally lab-only. Use secrets and a dedicated database account for real deployments.
