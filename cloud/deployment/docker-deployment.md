# Docker and Automated Deployment

## Docker Compose Services

| Container | Image / Build | Port | Persistent Data |
|---|---|---:|---|
| Mosquitto | `eclipse-mosquitto:2` | 1883 | `mosquitto/data`, `mosquitto/log` |
| Node-RED | `nodered/node-red:latest` | 1880 | `nodered-data` |
| InfluxDB | `influxdb:2.7` | 8086 | `influxdb-data` |
| Grafana | `grafana/grafana:latest` | 3000 | `grafana-data` |
| Simulator | Built from `iot-simulator/` | Internal | Source code |

All services use `restart: unless-stopped`.

## Manual Deployment

```bash
cd ~/graduation-cloud
git pull origin main
docker compose -f compose.yaml config
docker compose up -d --build
docker ps
```

## CI/CD Workflow

A push to `main` triggers `.github/workflows/ci.yml`.

The workflow:

1. Checks out the repository.
2. Configures Python 3.12.
3. Installs simulator requirements.
4. Checks Python syntax.
5. Validates `compose.yaml`.
6. Builds the simulator image.
7. Connects to EC2 through SSH.
8. Runs `git pull origin main`.
9. Runs `docker compose up -d --build`.
10. Runs `docker ps` for verification.

## GitHub Secret Names

- `EC2_HOST`
- `EC2_USER`
- `EC2_SSH_KEY`

Never publish their values.

## Screenshots Required

- `01-docker-ps.png`
- `02-docker-compose-ps.png`
- `03-github-actions-success.png`
- `04-deployment-job-steps.png`
- `05-ec2-after-deployment.png`
