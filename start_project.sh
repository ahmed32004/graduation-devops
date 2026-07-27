#!/bin/bash

echo "===================================="
echo " Graduation DevOps IoT Project"
echo "===================================="

echo ""
echo "Checking AWS Services..."
echo ""

# Grafana
if curl -s http://100.54.255.154:3000 > /dev/null; then
    echo "✅ Grafana is running"
else
    echo "❌ Grafana is NOT reachable"
fi

# Node-RED
if curl -s http://100.54.255.154:1880 > /dev/null; then
    echo "✅ Node-RED is running"
else
    echo "❌ Node-RED is NOT reachable"
fi

# InfluxDB
if curl -s http://100.54.255.154:8086/health > /dev/null; then
    echo "✅ InfluxDB is running"
else
    echo "❌ InfluxDB is NOT reachable"
fi

echo ""
echo "Starting IoT Simulator..."
echo ""

./run.sh

