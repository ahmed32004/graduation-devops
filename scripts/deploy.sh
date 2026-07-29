#!/bin/bash

set -e

echo "========================================="
echo " Deploying Graduation DevOps Project"
echo "========================================="

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

echo ""
echo "Pulling latest code..."
git pull origin main

echo ""
echo "Rebuilding containers..."
docker compose up -d --build

echo ""
echo "Running containers:"
docker ps

echo ""
echo "========================================="
echo " Deployment Completed Successfully"
echo "========================================="
