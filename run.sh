#!/bin/bash

echo "=================================="
echo " Graduation IoT Simulator"
echo "=================================="

cd "$(dirname "$0")/iot-simulator"

# إنشاء Virtual Environment إذا مش موجود
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
fi

# تفعيل البيئة
source .venv/bin/activate

# تحديث pip
python -m pip install --upgrade pip

# تثبيت المكتبات
pip install -r requirements.txt

echo ""
echo "Starting IoT Simulator..."
echo ""

python simulator.py
