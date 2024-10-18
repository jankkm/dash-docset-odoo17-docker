# Use a basic Python image
FROM python:3.9-slim

# Install git, doc2dash, and build tools
RUN apt-get update && \
    apt-get install -y git make gcc g++ && \
    pip install doc2dash

# Set the working directory
WORKDIR /app

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh
COPY odoo.png /odoo.png

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/app/entrypoint.sh"]
