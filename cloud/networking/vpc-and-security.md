# AWS Networking and Security Groups

The following network configuration was verified from the AWS Console. Sensitive identifiers, public IP addresses, and account information are masked in this public documentation.

## Cloud Network Information

| Item | Value |
|---|---|
| AWS Region | `eu-north-1` |
| Availability Zone | `eu-north-1b` |
| VPC CIDR | `172.31.0.0/16` |
| Subnet CIDR | `172.31.32.0/20` |
| Subnet Type | `Public Default Subnet` |
| Internet Gateway | `Yes — Gateway ID masked` |
| Default Route | `0.0.0.0/0 → Internet Gateway` |
| Elastic IP | `Yes — Address masked in public documentation` |
| EC2 Private IPv4 | `Masked in public documentation` |
| Connected PNETLab / VPN CIDR | `192.168.10.0/24 — validated through the IPsec tunnel` |
| VPC ID | `Masked in public documentation` |
| Subnet ID | `Masked in public documentation` |
| Route Table ID | `Masked in public documentation` |
| Security Group Name | `launch-wizard-1` |
| Security Group ID | `Masked in public documentation` |

## Security Group Register

The table below records the current AWS Security Group configuration and the recommended production restriction.

| Protocol | Port | Service | Current Source | Recommended Source |
|---|---:|---|---|---|
| TCP | 22 | SSH | `0.0.0.0/0` | Admin public IP or VPN only |
| TCP | 1883 | Mosquitto MQTT | `0.0.0.0/0` | VPN or approved IoT device network |
| TCP | 1880 | Node-RED | `0.0.0.0/0` | Admin public IP or VPN only |
| TCP | 3000 | Grafana | `0.0.0.0/0` | Approved users or VPN only |
| TCP | 8086 | InfluxDB | `0.0.0.0/0` | Internal network or VPN only |
| UDP | 500 | IPsec IKE | `0.0.0.0/0` | pfSense VPN peer public IP only |
| UDP | 4500 | IPsec NAT-T | `0.0.0.0/0` | pfSense VPN peer public IP only |
| ICMP | All | Connectivity Testing | `Single /32 public IP — masked` | Approved admin public IP only |
| All Traffic | All | Outbound Access | `0.0.0.0/0` | Required outbound internet access |

## Security Assessment

The current Security Group permits public access to several administration and application ports.

Before using the environment in production, the following ports should be restricted:

- SSH port `22` should be accessible only from the administrator IP address or through the VPN.
- Node-RED port `1880` should be restricted to the administrator network or VPN.
- InfluxDB port `8086` should not be publicly accessible.
- MQTT port `1883` should be accessible only from approved IoT devices or the VPN network.
- IPsec ports `500/UDP` and `4500/UDP` should be restricted to the pfSense peer public IP.
- Grafana port `3000` should be limited to approved users or protected using a reverse proxy and HTTPS.

## Network Flow

```text
PNETLab Enterprise Network
        |
        |  Site-to-Site IPsec VPN
        |
     pfSense
        |
        |  IKEv2 / UDP 500 and UDP 4500
        |
AWS Internet Gateway
        |
AWS Public Subnet
        |
EC2 Ubuntu Server
        |
Docker Compose Services
        |
Mosquitto → Node-RED → InfluxDB → Grafana
