cd /opt/SonarQube
sudo chown -R 1000:1000 . &&
sudo chmod 777 -R ./logs 
source ./sonar-scanner-ihm/.venv/bin/activate &&
nohup python ./sonar-scanner-ihm/app.py > ./logs/server$(date +'%Y%m%d_%H%M%S').log 2>&1 &