#!/bin/bash

# Setup logging
logfile="/home/${admin_username}/custom-data.log"
exec > $logfile 2>&1

python3 -V
sudo apt update
sudo apt install -y python3-pip python3-flask
python3 -m flask --version

sudo cat << EOF > /home/${admin_username}/hello.py
from flask import Flask
import requests

app = Flask(__name__)

import requests
@app.route('/')
def hello_world():
    return """<!DOCTYPE html>
<html>
<head>
    <title>Kittens</title>
</head>
<body>
    <img src="https://i1.wp.com/www.thedevcoach.co.uk/wp-content/uploads/2020/04/What-is-Terraform.png" alt="User Image">
</body>
</html>"""
EOF

chmod +x /home/${admin_username}/hello.py

sudo -b FLASK_APP=/home/${admin_username}/hello.py flask run --host=0.0.0.0 --port=8000

echo "Script complete."
