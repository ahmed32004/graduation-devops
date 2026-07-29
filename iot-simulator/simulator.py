import json
import random
import time
from datetime import datetime
import paho.mqtt.client as mqtt

# MQTT Configuration
BROKER = "56.228.24.28"
PORT = 1883
TOPIC = "sensors/test"

DEVICE_ID = "sensor-01"

client = mqtt.Client()


def connect():
    try:
        client.connect(BROKER, PORT, 60)
        print("✅ Connected to MQTT Broker")
        return True
    except Exception as e:
        print("❌ Connection Error:", e)
        return False


def generate_sensor_data():
    return {
        "device_id": DEVICE_ID,
        "temperature": round(random.uniform(20, 40), 2),
        "humidity": round(random.uniform(40, 80), 2),
        "timestamp": datetime.now().isoformat()
    }


if connect():

    while True:

        data = generate_sensor_data()

        payload = json.dumps(data)

        result = client.publish(TOPIC, payload)

        if result.rc == 0:
            print("📤", payload)
        else:
            print("❌ Publish Failed")

        time.sleep(5)
