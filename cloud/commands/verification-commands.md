# Cloud Verification Commands

Run these commands on EC2 and capture clear screenshots without credentials or tokens.

## System

```bash
hostnamectl
uname -a
cat /etc/os-release
uptime
free -h
```

## Storage

```bash
lsblk
df -h
docker system df
```

## Docker

```bash
docker --version
docker compose version
docker ps
docker compose ps
docker compose -f ~/graduation-cloud/compose.yaml config --services
```

## Network

```bash
ip -brief address
ip route
sudo ss -tulpn
```

## SSH and VPN

```bash
sudo systemctl status ssh --no-pager
sudo sshd -T | grep -E 'passwordauthentication|permitrootlogin|pubkeyauthentication'
sudo systemctl status strongswan-starter --no-pager
sudo ipsec statusall
```

## Repository and Deployment

```bash
cd ~/graduation-cloud
git remote -v
git branch --show-current
git log -5 --oneline
docker compose up -d --build
docker ps
```
