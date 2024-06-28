repo=$1 
branch=$2
tmp_project_root="tmp-$repo-$branch"


cd /opt/ANEF-src
echo "** clone $repo **"
sudo git clone git@github.com:MI-ANEF/"$repo" "$tmp_project_root"
sudo chown -R $(whoami):"domain users" "$tmp_project_root"
cd "$tmp_project_root"

echo "** switch $branch **"
if ! sudo git switch "$branch"; then
    echo "** Error: Echec de changement de branch. ('$branch') **"
    exit 1
fi

echo "** update sonar-project.properties **"
if [ ! -f "sonar-project.properties" ]; then
    echo "Error: sonar-project.properties introuvable."
    exit 1
fi
sudo sed -i "s/projectName=.*/projectName=$repo - $branch/" sonar-project.properties

echo "** run sonar scanner **"
sudo podman run \
    --rm \
    -e SONAR_HOST_URL="http://10.29.151.18:9000" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=$repo-$branch" \
    -e SONAR_TOKEN="sqa_9411830d5a3c07d17bed1e3b05e674f103da52c8" \
    -v "/opt/ANEF-src/$tmp_project_root:/usr/src:z" \
    sonarsource/sonar-scanner-cli

cd /opt/ANEF-src
echo "** remove '$tmp_project_root' **"
sudo rm -rf "$tmp_project_root"