sudo podman run \
    --rm \
    -e SONAR_HOST_URL="http://10.29.151.18:9000" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=anef-ui-lib" \
    -e SONAR_TOKEN="sqa_57c8898f6b021f372215374cbf2453d05b3c8fec" \
    -v "/opt/ANEF-src/anef-ui-lib:/usr/src:z" \
    sonarsource/sonar-scanner-cli

