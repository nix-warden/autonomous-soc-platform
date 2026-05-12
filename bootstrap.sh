#!/bin/bash
# ==========================================
# AUTONOMOUS SOC PLATFORM - BOOTSTRAP SCRIPT
# ==========================================

CERT_DIR="./siem/config/wazuh_indexer_ssl_certs"
# List of critical certificates needed for the indexer to start
REQUIRED_FILES=("wazuh.indexer.pem" "wazuh.indexer-key.pem" "root-ca.pem" "admin.pem" "admin-key.pem")

echo "[*] Checking Wazuh Indexer certificates..."

# Create directory if it doesn't exist
mkdir -p "$CERT_DIR"
chmod 777 "$CERT_DIR"

# 1. Check if the directory is completely empty
if [ -z "$(ls -A $CERT_DIR)" ]; then
    echo "[!] Certificate directory is empty. Generating new certificates..."
    
    # Run the standalone cert generator
    docker compose --env-file .env -f siem/generate-indexer-certs.yml run --rm generator
    
    # Fix permissions back
    chmod 755 "$CERT_DIR"
    echo "[*] Certificates generated successfully."

else
    # 2. If not empty, verify that all REQUIRED files exist
    for file in "${REQUIRED_FILES[@]}"; do
        if [ ! -f "$CERT_DIR/$file" ]; then
            echo "[!!!] ERROR: Required certificate is missing: $file"
            echo "[!!!] Fix: rm -rf $CERT_DIR/* and run ./bootstrap.sh again."
            exit 1
        fi
    done
    echo "[*] All required certificates found. Skipping generation."
fi

# 3. Start the main platform
echo "[*] Starting the Autonomous SOC Platform..."
docker compose --env-file .env up -d

echo "[*] Done! Run 'docker compose ps' to check the status."