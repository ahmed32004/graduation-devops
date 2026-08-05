# Cloud Screenshot Checklist

Use PNG format. Hide account numbers, passwords, tokens, keys, and unnecessary public IP information.

## AWS Console

- [ ] EC2 instance summary and Running state
- [ ] Instance details: type, AMI, VPC, subnet
- [ ] EC2 passed status checks
- [ ] EBS volume showing 30 GB
- [ ] Security group inbound rules
- [ ] Security group outbound rules
- [ ] VPC summary
- [ ] Subnet details
- [ ] Route table
- [ ] Optional CloudWatch graphs

## EC2 Terminal

- [ ] `hostnamectl` and `/etc/os-release`
- [ ] `docker ps`
- [ ] `docker compose ps`
- [ ] `df -h`
- [ ] `lsblk`
- [ ] `ss -tulpn`
- [ ] SSH hardening verification
- [ ] StrongSwan status
- [ ] Successful deployment output

## GitHub

- [ ] Repository home page
- [ ] Successful GitHub Actions workflow
- [ ] Workflow job steps
- [ ] Successful deployment step
- [ ] Latest commit

## Never Upload

- Private keys
- AWS/GitHub secret values
- Telegram or InfluxDB tokens
- Passwords
- `ipsec.secrets`
