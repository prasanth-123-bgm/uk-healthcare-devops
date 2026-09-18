#!/bin/bash

set -e

echo "Starting deployment..."

DEPLOY_DIR="deployment"

mkdir -p "$DEPLOY_DIR"

cp app-artifact/*.jar "$DEPLOY_DIR/"

echo "Deployed artifact:"
ls -lh "$DEPLOY_DIR"

if compgen -G "$DEPLOY_DIR/*.jar" > /dev/null; then
    echo "Deployment verification successful."
else
    echo "Deployment verification failed."
    exit 1
fi

echo "Deployment completed successfully."