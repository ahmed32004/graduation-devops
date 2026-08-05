# Amazon EC2 Setup

## Purpose

The EC2 instance is the central cloud server for the Dockerized IoT platform.

## Implemented Configuration

- Cloud provider: Amazon Web Services
- Service: Amazon EC2
- Operating system: Ubuntu Linux
- Remote access: SSH key authentication
- Project directory: `~/graduation-cloud`
- Container platform: Docker and Docker Compose
- Final EBS size: 30 GB

## Deployment Procedure

1. Launch an Ubuntu EC2 instance.
2. Select the required instance type, VPC, and subnet.
3. Attach a restricted security group.
4. Configure an SSH key pair.
5. Connect to the server through SSH.
6. Install Git, Docker Engine, and Docker Compose.
7. Clone the repository into `~/graduation-cloud`.
8. Validate and start the Docker Compose stack.
9. Verify containers, storage, and listening ports.
10. Configure GitHub Actions secrets for automated deployment.

## Example Commands

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y git docker.io docker-compose-plugin
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"
```

```bash
cd ~
git clone https://github.com/ahmed32004/graduation-devops.git graduation-cloud
cd graduation-cloud
docker compose -f compose.yaml config
docker compose up -d --build
docker ps
```

## Screenshots Required

- `01-ec2-instance-summary.png`
- `02-ec2-instance-details.png`
- `03-ubuntu-ssh-session.png`
