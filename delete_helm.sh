#!/bin/bash

# Stop script on any error
set -e

# --- Helm Uninstall ---

echo "Uninstalling Helm releases..."

echo "Uninstalling backend..."
helm uninstall backend || echo "Release 'backend' not found or uninstall failed."

echo "Uninstalling postgres..."
helm uninstall postgres || echo "Release 'postgres' not found or uninstall failed."

echo "Uninstalling nginx-ingress..."
helm uninstall nginx-ingress || echo "Release 'nginx-ingress' not found or uninstall failed."

echo "Uninstalling nginx-controller from ingress-nginx namespace..."
helm uninstall nginx-controller -n ingress-nginx || echo "Release 'nginx-controller' in namespace 'ingress-nginx' not found or uninstall failed."

echo "Helm uninstall commands executed."

# --- Verify Nginx Service Deletion ---

NGINX_SVC_NAME="nginx-controller-ingress-nginx-controller"
NGINX_NAMESPACE="ingress-nginx"
TIMEOUT_SECONDS=120 # Wait for 2 minutes max
WAIT_INTERVAL=3    # Check every 3 seconds
elapsed_time=0

echo "Verifying deletion of Nginx controller service ($NGINX_SVC_NAME in namespace $NGINX_NAMESPACE)..."

while [ $elapsed_time -lt $TIMEOUT_SECONDS ]; do
    # Check if the service exists. 
    # 'kubectl get' returns exit code 0 if found, non-zero (usually 1) if not found.
    if ! kubectl get service "$NGINX_SVC_NAME" -n "$NGINX_NAMESPACE" > /dev/null 2>&1; then
        echo "Service $NGINX_SVC_NAME successfully deleted."
        exit 0 # Success
    fi
    
    echo "Service $NGINX_SVC_NAME still present. Waiting ${WAIT_INTERVAL}s..."
    sleep $WAIT_INTERVAL
    elapsed_time=$((elapsed_time + WAIT_INTERVAL))
done

echo "Timeout ($TIMEOUT_SECONDS seconds) reached. Service $NGINX_SVC_NAME might still be present."
exit 1 # Failure