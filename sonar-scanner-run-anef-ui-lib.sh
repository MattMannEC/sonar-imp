sudo podman run \
    --rm \
    -e SONAR_HOST_URL="http://10.29.151.18:9000" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=anef-ui-lib" \
    -e SONAR_TOKEN="sqa_9411830d5a3c07d17bed1e3b05e674f103da52c8" \
    -v "/opt/ANEF-src/anef-ui-lib:/usr/src:z" \
    sonarsource/sonar-scanner-cli

