#!/bin/bash

# Clone the specific branch of the repository with depth=1
git clone --depth=1 --branch=17.0 https://github.com/odoo/documentation.git /app/documentation

# Change working directory to the cloned repository
cd /app/documentation

# Install Python requirements
pip install -r requirements.txt

# Run make to build the documentation
make html

# Convert the built documentation to a Dash docset using doc2dash
doc2dash -i /odoo.png -d "/app/output" -n "Odoo 17.0" _build/html/

echo "Docset created at /app/ouput/Odoo 17.0.docset"
