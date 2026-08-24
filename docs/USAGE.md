# Usage

## Start SonarQube locally

```bash
./scripts/start_sonarqube.sh
```

Open `http://localhost:9000` and create a user token.

## Scan Node.js

```bash
export SONAR_HOST_URL=http://localhost:9000
export SONAR_TOKEN='your-token'
./scripts/run_sonar_scanner_node.sh
```

## Scan Java

```bash
export SONAR_HOST_URL=http://localhost:9000
export SONAR_TOKEN='your-token'
./scripts/run_sonar_scanner_java.sh
```

## GitHub Actions

The repository test workflow always runs. Sonar analysis runs only when both `SONAR_HOST_URL` and `SONAR_TOKEN` are configured as repository secrets. The workflow does not suppress scan failures.

## Jenkins

Create secret-text credentials named `sonar-host` and `sonar-token`, then run the included `jenkins/Jenkinsfile`.

## Cleanup

```bash
./scripts/stop_sonarqube.sh
```

The Compose stack is for learning/local CI labs. Use unique credentials and follow SonarSource host/database requirements for any persistent deployment.
