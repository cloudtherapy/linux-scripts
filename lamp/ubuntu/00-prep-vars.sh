#!/bin/bash

# Get the host's IP address
HOST_IP=$(hostname -I | awk '{print $1}')

# Path to the ssl-ubuntu.conf file
CONF_FILE="ssl-ubuntu.conf"

# Check if the file exists
if [[ -f "$CONF_FILE" ]]; then
    # Replace ${SERVER_IP} with the host's IP address
    sed -i "s/\${SERVER_IP}/$HOST_IP/g" "$CONF_FILE"
    echo "Replaced \${SERVER_IP} with $HOST_IP in $CONF_FILE"
else
    echo "Error: $CONF_FILE not found."
    exit 1
fi