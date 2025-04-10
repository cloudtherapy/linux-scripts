#!/bin/bash

# Get the host's IP address
HOST_IP=$(hostname -I | awk '{print $1}')

# Path to the ssl-ubuntu.conf file
CONF_FILE="ssl-ubuntu.conf"

# Check if the file exists
if [[ -f "$CONF_FILE" ]]; then
    # Update the ServerName line with the host's IP address
    sed -i "s/^ServerName .*/ServerName $HOST_IP/" "$CONF_FILE"
    echo "Updated ServerName in $CONF_FILE to $HOST_IP"
else
    echo "Error: $CONF_FILE not found."
    exit 1
fi