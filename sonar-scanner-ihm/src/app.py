from flask import Flask, request, render_template
import subprocess
import logging
logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)

app = Flask(__name__)
repos = [
    "aef-portail-agent",
    "aef-portail-usager",
    "anef-ui-lib",
    "gaip-front",
    "gaip-api",
    "sianf-front-agents",
    "sief-back",
]

scripts_dir = "/app"

@app.route("/")
def index():
    return render_template("index.html", repos=repos)

@app.route("/run", methods=["POST"])
def run():
    repo = request.form["repo"]
    branch = request.form["branch"]
    logger.info(f"Params: repo => {repo}, branch => {branch}")
    try:
        result = subprocess.run(
            f"{scripts_dir}/sonar-scanner-run-{repo}.sh", shell=True, capture_output=True, text=True, check=True
        )
        output = result.stdout + result.stderr
    except subprocess.CalledProcessError as e:
        output = e.stdout + e.stderr
    return render_template("output.html", output=output)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
