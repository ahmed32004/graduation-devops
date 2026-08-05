# Amazon EBS Storage Expansion

## Background

The original filesystem became full while Docker services and persistent data were operating. The EBS volume was increased to 30 GB.

## Linux Expansion Commands

```bash
sudo growpart /dev/nvme0n1 1
sudo resize2fs /dev/nvme0n1p1
df -h
```

## Result

- EBS volume: 30 GB
- Usable Linux filesystem: approximately 28 GB
- Additional capacity became available for Docker images, logs, and application data.

## Verification

```bash
lsblk
df -h
docker system df
```

## Screenshots Required

- `01-ebs-volume-30gb.png`
- `02-lsblk-after-expansion.png`
- `03-df-h-after-expansion.png`
