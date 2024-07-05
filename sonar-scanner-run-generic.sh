repo=$1 
branch=$2
tmp_project_root="tmp-$repo-$branch"

# Load environment variables from .env file
set -a
source .env
set +a


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
    -e SONAR_HOST_URL="$SONAR_HOST_URL" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=$repo-$branch" \
    -e SONAR_TOKEN="$SONAR_TOKEN" \
    -v "/opt/ANEF-src/$tmp_project_root:/usr/src:z" \
    sonarsource/sonar-scanner-cli

cd /opt/ANEF-src
echo "** remove '$tmp_project_root' **"
sudo rm -rf "$tmp_project_root"