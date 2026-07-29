#!/bin/bash

echo "========================================="
echo " Graduation DevOps Project"
echo "========================================="
echo ""

echo "Checking cloud services..."
echo ""

./scripts/status.sh

echo ""
echo "Starting IoT Simulator..."
echo ""

./scripts/run.sh
