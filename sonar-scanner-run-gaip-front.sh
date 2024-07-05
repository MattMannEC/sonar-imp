# Load environment variables from .env file
set -a
source .env
set +a

sudo podman run \
    --rm \
    -e SONAR_HOST_URL="$SONAR_HOST_URL" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=gaip-front" \
    -e SONAR_TOKEN="$SONAR_TOKEN" \
    -v "/opt/ANEF-src/gaip-front:/usr/src:z" \
    sonarsource/sonar-scanner-cli

