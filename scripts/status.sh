#!/bin/bash

echo "========================================="
echo " Graduation DevOps Project Status"
echo "========================================="
echo ""

check_service () {
    NAME=$1
    URL=$2

    if curl -s --connect-timeout 3 "$URL" > /dev/null
    then
        echo "✅ $NAME : Running"
    else
        echo "❌ $NAME : Offline"
    fi
}

check_service "Grafana" "http://56.228.24.28:3000"
check_service "Node-RED" "http://56.228.24.28:1880"
check_service "InfluxDB" "http://56.228.24.28:8086/health"

echo ""

if nc -z 56.228.24.28 1883
then
    echo "✅ MQTT Broker : Running"
else
    echo "❌ MQTT Broker : Offline"
fi

echo ""
echo "========================================="
