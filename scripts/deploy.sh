#!/bin/bash

set -e

echo "Starting deployment..."

DEPLOY_DIR="deployment"

mkdir -p "$DEPLOY_DIR"

cp app-artifact/*.jar "$DEPLOY_DIR/"

echo "Deployed artifact:"
ls -lh "$DEPLOY_DIR"

echo "Deployment completed successfully."