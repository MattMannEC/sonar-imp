# Load environment variables from .env file
set -a
source /opt/SonarQube/.env
set +a

sudo podman run \
    --rm \
    -e SONAR_HOST_URL="$SONAR_HOST_URL" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=aef-portail-usager" \
    -e SONAR_TOKEN="$SONAR_TOKEN" \
    -v "/opt/ANEF-src/aef-portail-usager:/usr/src:z" \
    sonarsource/sonar-scanner-cli

