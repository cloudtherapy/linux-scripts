#!/bin/bash

# Get the host's IP address
HOST_IP=$(hostname -I | awk '{print $1}')

# Get the hostname
HOSTNAME=$(hostname)

# Get the fully qualified domain name (FQDN)
FQDN=$(hostname -f)

# Path to the ssl-ubuntu.conf file
SSL_CONF_FILE="ssl-rocky.conf"

# Path to the ubuntu-cert.cnf file
CERT_CONF_FILE="rocky-cert.conf"

# Update ssl-ubuntu.conf
if [[ -f "$SSL_CONF_FILE" ]]; then
    # Replace ${SERVER_IP} with the host's IP address
    sed -i "s/\${SERVER_IP}/$HOST_IP/g" "$SSL_CONF_FILE"
    echo "Replaced \${SERVER_IP} with $HOST_IP in $SSL_CONF_FILE"
else
    echo "Error: $SSL_CONF_FILE not found."
    exit 1
fi

# Update ubuntu-cert.cnf
if [[ -f "$CERT_CONF_FILE" ]]; then
    # Replace ${HOSTNAME} with the hostname
    sed -i "s/\${HOSTNAME}/$HOSTNAME/g" "$CERT_CONF_FILE"
    echo "Replaced \${HOSTNAME} with $HOSTNAME in $CERT_CONF_FILE"

    # Replace ${FQDN} with the FQDN
    sed -i "s/\${FQDN}/$FQDN/g" "$CERT_CONF_FILE"
    echo "Replaced \${FQDN} with $FQDN in $CERT_CONF_FILE"

    # Replace ${SERVER_IP} with the host's IP address
    sed -i "s/\${SERVER_IP}/$HOST_IP/g" "$CERT_CONF_FILE"
    echo "Replaced \${SERVER_IP} with $HOST_IP in $CERT_CONF_FILE"
else
    echo "Error: $CERT_CONF_FILE not found."
    exit 1
fi