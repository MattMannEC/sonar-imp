cd /opt/ANEF-src
cd aef-portail-agent
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
cd aef-portail-usager
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
cd anef-ui-lib
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
cd gaip-api
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
cd gaip-front
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
cd sianf-front-agents
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
cd sief-back
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown -R $(whoami):"domain users" /opt/ANEF-src
sh /opt/SonarQube/sonar-scanner-run-aef-portail-agent.sh
sh /opt/SonarQube/sonar-scanner-run-aef-portail-usager.sh
sh /opt/SonarQube/sonar-scanner-run-anef-ui-lib.sh
sh /opt/SonarQube/sonar-scanner-run-gaip-front.sh
#sh /opt/SonarQube/sonar-scanner-run-gaip-api.sh
sh /opt/SonarQube/sonar-scanner-run-sianf-front-agents.sh
sh /opt/SonarQube/sonar-scanner-run-sief-back.sh
