# Server and Service Monitoring

## Monitoring Commands

```bash
uptime
free -h
df -h
lsblk
docker ps
docker compose ps
docker system df
sudo systemctl status docker --no-pager
sudo ss -tulpn
sudo journalctl -u docker --since "24 hours ago" --no-pager
```

## Expected Ports

```text
22/tcp    SSH
1880/tcp  Node-RED
1883/tcp  Mosquitto
3000/tcp  Grafana
8086/tcp  InfluxDB
500/udp   StrongSwan IKE
4500/udp  StrongSwan NAT-T
```

## Screenshots Required

- `01-uptime-and-memory.png`
- `02-filesystem-usage.png`
- `03-running-containers.png`
- `04-listening-ports.png`
- `05-aws-instance-status-checks.png`
