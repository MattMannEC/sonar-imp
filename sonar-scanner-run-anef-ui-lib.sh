# Load environment variables from .env file
set -a
source ./.env
set +a

sudo podman run \
    --rm \
    -e SONAR_HOST_URL="$SONAR_HOST_URL" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=anef-ui-lib" \
    -e SONAR_TOKEN="$SONAR_TOKEN" \
    -v "/opt/ANEF-src/anef-ui-lib:/usr/src:z" \
    sonarsource/sonar-scanner-cli

