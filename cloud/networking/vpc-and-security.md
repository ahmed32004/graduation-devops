# AWS Networking and Security Groups

## Required Cloud Network Information

| Item | Value |
|---|---|
| VPC CIDR | `TO_BE_PROVIDED` |
| Subnet CIDR | `TO_BE_PROVIDED` |
| Subnet Type | `PUBLIC_OR_PRIVATE` |
| Internet Gateway | `YES_OR_NO` |
| Default Route | `TO_BE_PROVIDED` |
| Elastic IP | `YES_OR_NO` |
| Connected PNETLab / VPN CIDR | `TO_BE_PROVIDED` |

## Security Group Register

| Protocol | Port | Service | Preferred Source |
|---|---:|---|---|
| TCP | 22 | SSH | Team/admin IP only |
| TCP | 1883 | MQTT | VPN or device network |
| TCP | 1880 | Node-RED | Admin IP or VPN |
| TCP | 3000 | Grafana | Approved users or VPN |
| TCP | 8086 | InfluxDB | Internal or VPN |
| UDP | 500 | IKE | VPN peer IP |
| UDP | 4500 | IPsec NAT-T | VPN peer IP |

Avoid exposing SSH, Node-RED, and InfluxDB to `0.0.0.0/0`.

## Screenshots Required

- `01-vpc-summary.png`
- `02-subnet-details.png`
- `03-route-table.png`
- `04-security-group-inbound-rules.png`
- `05-security-group-outbound-rules.png`
