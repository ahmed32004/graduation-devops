#!/bin/bash

echo "=================================="
echo " Starting IoT Simulator"
echo "=================================="

cd "$(dirname "$0")/../iot-simulator"

if [ ! -d ".venv" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv .venv

    source .venv/bin/activate

    pip install -r requirements.txt
else
    source .venv/bin/activate
fi

echo ""
echo "Starting simulator..."
echo ""

python simulator.py
