# Load environment variables from .env file
set -a
source /opt/SonarQube/.env
set +a

sudo podman run \
    --rm \
    -e SONAR_HOST_URL="$SONAR_HOST_URL" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=sief-back" \
    -e SONAR_TOKEN="$SONAR_TOKEN" \
    -v "/opt/ANEF-src/sief-back:/usr/src:z" \
    sonarsource/sonar-scanner-cli

è