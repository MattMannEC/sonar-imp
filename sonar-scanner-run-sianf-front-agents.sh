# Load environment variables from .env file
set -a
source /opt/SonarQube/.env
set +a

sudo podman run \
    --rm \
    -e SONAR_HOST_URL="$SONAR_HOST_URL" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=sianf-front-agents" \
    -e SONAR_TOKEN="$SONAR_TOKEN" \
    -v "/opt/ANEF-src/sianf-front-agents:/usr/src:z" \
    sonarsource/sonar-scanner-cli

