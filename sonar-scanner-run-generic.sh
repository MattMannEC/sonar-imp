repo=$1 
branch=$2
tmp_project_root="/opt/ANEF-src/tmp-$repo-$branch"

mkdir "$tmp_project_root"
cd "$tmp_project_root"
sudo git clone git@github.com:MI-ANEF/"$repo"

if [ ! -d "$tmp_project_root/.git" ]; then
    echo "Error: Repo git introuvable ('$repo')"
    exit 1
fi

if ! git switch "$branch"; then
    echo "Error: Echec de changement de branch.('$branch')"
    exit 1
fi

sudo podman run \
    --rm \
    -e SONAR_HOST_URL="http://10.29.151.18:9000" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=$repo" \
    -e SONAR_TOKEN="sqa_57c8898f6b021f372215374cbf2453d05b3c8fec" \
    -v "/opt/ANEF-src/$tmp_project_root:/usr/src:z" \
    sonarsource/sonar-scanner-cli

cd /opt/ANEF-src
sudo rm -rf "$tmp_project_root"