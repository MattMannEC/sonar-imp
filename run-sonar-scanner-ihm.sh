sudo chown -R $(whoami):"domain users" /opt/SonarQube &&
sudo chmod 775 -R /opt/SonarQube/logs
source ./sonar-scanner-ihm/.venv/bin/activate &&
nohup python ./sonar-scanner-ihm/app.py > ./logs/server$(date +'%Y%m%d_%H%M%S').log 2>&1 &