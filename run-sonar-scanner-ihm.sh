cd /opt/SonarQube
sudo chown -R 1000:1000 . && 
source ./sonar-scanner-ihm/.venv/bin/activate && 
nohup python ./sonar-scanner-ihm/app.py > ./sonar-scanner-ihm/server$(date +'%Y%m%d_%H%M%S').log 2>&1 &