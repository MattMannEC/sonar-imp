cd /opt/ANEF-src
cd aef-portail-agent
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown 1000:1000 -R aef-portail-agent
cd aef-portail-usager
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown 1000:1000 -R aef-portail-usager
cd anef-ui-lib
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown 1000:1000 -R anef-ui-lib
cd gaip-api
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown 1000:1000 -R gaip-api
cd gaip-front
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown 1000:1000 -R gaip-front
cd sianf-front-agents
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown 1000:1000 -R sianf-front-agents
cd sief-back
sudo git checkout develop
sudo git reset --hard origin/develop
cd ..
sudo chown 1000:1000 -R sief-back
sh /opt/SonarQube/sonar-scanner-run-aef-portail-agent.sh
sh /opt/SonarQube/sonar-scanner-run-aef-portail-usager.sh
sh /opt/SonarQube/sonar-scanner-run-anef-ui-lib.sh
sh /opt/SonarQube/sonar-scanner-run-gaip-front.sh
#sh /opt/SonarQube/sonar-scanner-run-gaip-api.sh
sh /opt/SonarQube/sonar-scanner-run-sianf-front-agents.sh
sh /opt/SonarQube/sonar-scanner-run-sief-back.sh
