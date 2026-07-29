# IoT Monitoring System with DevOps & CI/CD

## Overview

This project demonstrates a complete IoT monitoring system using modern DevOps practices.

The system simulates IoT sensor data, sends it through an MQTT broker, processes it with Node-RED, stores it in InfluxDB, visualizes it using Grafana, and sends alerts through Telegram.

The entire deployment is automated using GitHub Actions and AWS EC2.

---

## Architecture

VM (Python Simulator)
        │
        ▼
Mosquitto MQTT Broker
        │
        ▼
Node-RED
        │
        ▼
InfluxDB
        │
        ▼
Grafana Dashboard
        │
        ▼
Telegram Notifications

---

## Technologies

- Python
- Docker
- Docker Compose
- Mosquitto MQTT
- Node-RED
- InfluxDB 2.x
- Grafana
- GitHub Actions
- AWS EC2
- Linux (Ubuntu)

---

## Project Structure

```text
graduation-devops/
├── compose.yaml
├── docs/
├── iot-simulator/
├── mosquitto/
├── scripts/
└── README.md
```

---

## Running the Project

Start the simulator:

```bash
./scripts/run.sh
```

Start the project:

```bash
./scripts/start.sh
```

Check project status:

```bash
./scripts/status.sh
```

Stop cloud services:

```bash
./scripts/stop.sh
```

---

## CI/CD Pipeline

Every push to the **main** branch automatically:

- Validates the project
- Connects to AWS EC2
- Deploys the latest version
- Restarts Docker services

---

## Team Members

- DevOps Engineer
- IoT Engineer
- Cloud Engineer
- Network Engineer
