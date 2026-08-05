# AWS Cloud Infrastructure

## Overview

This directory documents the AWS cloud layer of **DevOps Automation for IoT Device Deployment Using AI**.

The cloud environment hosts the Dockerized IoT monitoring platform on an Amazon EC2 Ubuntu server. The deployed stack contains:

- Eclipse Mosquitto MQTT Broker
- Node-RED
- InfluxDB 2.7
- Grafana
- Python IoT Simulator

The repository CI/CD workflow validates the project and deploys updates to EC2 after every push to the `main` branch.

## Verified Deployment Model

```text
Developer -> GitHub -> GitHub Actions -> AWS EC2 -> Docker Compose
                                                |
                                                +-> Mosquitto -> Node-RED -> InfluxDB -> Grafana
                                                     ^                                   |
                                                     |                                   +-> Telegram Alerts
                                               IoT Simulator / Network Source
```

## Main Components

| Component | Purpose |
|---|---|
| Amazon EC2 | Hosts Ubuntu and the Docker services |
| Amazon EBS | Stores the OS, repository, images, logs, and persistent data |
| VPC / Subnet | Provides the AWS network environment |
| Security Group | Controls network access |
| SSH Key Authentication | Secures administration and deployment |
| StrongSwan VPN | Encrypts communication with the external lab/network |
| Docker Compose | Deploys and manages the containers |
| GitHub Actions | Validates, builds, and deploys updates |

## Application Ports

| Port | Service |
|---:|---|
| 22/TCP | SSH |
| 1883/TCP | Mosquitto MQTT |
| 1880/TCP | Node-RED |
| 3000/TCP | Grafana |
| 8086/TCP | InfluxDB |
| 500/UDP | StrongSwan IKE |
| 4500/UDP | StrongSwan NAT-T |

## Documentation

- [EC2 Setup](ec2/ec2-setup.md)
- [Instance Details](ec2/instance-details.md)
- [VPC and Security Groups](networking/vpc-and-security.md)
- [StrongSwan VPN](vpn/strongswan-vpn.md)
- [Docker Deployment](deployment/docker-deployment.md)
- [EBS Expansion](storage/ebs-expansion.md)
- [SSH Hardening](security/ssh-hardening.md)
- [Server Monitoring](monitoring/server-monitoring.md)
- [Verification Commands](commands/verification-commands.md)
- [Cloud Facts Template](metadata/cloud-facts-template.md)
- [Screenshot Checklist](screenshots-checklist.md)

## Security Notice

Never upload private keys, `.pem`, `.ppk`, `.env`, AWS access keys, GitHub secrets, Telegram tokens, InfluxDB tokens, passwords, `authorized_keys`, or `ipsec.secrets`.
