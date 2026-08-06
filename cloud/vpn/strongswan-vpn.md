# StrongSwan Site-to-Site IPsec VPN

The VPN configuration was verified using the AWS EC2 StrongSwan server and the pfSense IPsec status page. Sensitive public IP addresses, peer addresses, identifiers, SPI values, and authentication secrets are masked in this public documentation.

## Purpose

StrongSwan provides an encrypted Site-to-Site IPsec tunnel between the PNETLab enterprise network behind pfSense and the AWS EC2 Ubuntu server.

The tunnel allows internal IoT traffic to reach the Dockerized cloud services securely without exposing private network communication directly over the internet.

## VPN Configuration

| Field | Value |
|---|---|
| VPN Type | `Site-to-Site IPsec VPN` |
| VPN Gateways | `pfSense ↔ AWS EC2 StrongSwan` |
| AWS Protected Host | `172.31.42.241/32 — private address masked in screenshots` |
| Validated PNETLab Network | `192.168.10.0/24` |
| AWS Public Endpoint | `Masked in public documentation` |
| pfSense Public Peer | `Masked in public documentation` |
| IKE Version | `IKEv2` |
| Authentication | `Pre-Shared Key — value never published` |
| NAT Traversal | `Enabled — UDP 4500` |
| IKE Port | `UDP 500` |
| IPsec NAT-T Port | `UDP 4500` |
| Phase 1 Status | `Established` |
| Phase 2 Status | `Installed` |
| Tunnel Traffic | `Packets and bytes successfully transmitted` |

## Phase 1 — IKE Security Association

| Parameter | Value |
|---|---|
| Encryption | `AES-CBC-256` |
| Integrity | `HMAC-SHA2-256-128` |
| Pseudorandom Function | `PRF-HMAC-SHA2-256` |
| Diffie-Hellman Group | `MODP 2048 — Group 14` |
| IKE Version | `IKEv2` |
| Authentication Method | `Pre-Shared Key` |
| Status | `Established` |

## Phase 2 — Child Security Association

| Parameter | Value |
|---|---|
| Local Network | `192.168.10.0/24` |
| Remote AWS Host | `172.31.42.241/32` |
| Encryption | `AES-CBC-256` |
| Integrity | `HMAC-SHA2-256-128` |
| IP Compression | `None` |
| Status | `Installed` |
| Traffic Validation | `Packets In and Packets Out recorded` |

## VPN Architecture

```text
PNETLab Enterprise Network
        |
        |  VLAN 10
        |  192.168.10.0/24
        |
     pfSense
        |
        |  IKEv2 Site-to-Site IPsec
        |  AES-256 / SHA-256 / DH Group 14
        |  UDP 500 and UDP 4500
        |
     Internet
        |
AWS EC2 Ubuntu Server
        |
     StrongSwan
        |
        |  AWS Private Host
        |
Docker Compose Platform
        |
Mosquitto → Node-RED → InfluxDB → Grafana


AWS Security Group Requirements

The following inbound rules are required for the VPN:

| Protocol | Port | Purpose             | Recommended Source          |
| -------- | ---: | ------------------- | --------------------------- |
| UDP      |  500 | IKE negotiation     | pfSense public peer IP only |
| UDP      | 4500 | IPsec NAT Traversal | pfSense public peer IP only |

StrongSwan Validation Commands

Run the following commands on the AWS EC2 Ubuntu server:

sudo systemctl status strongswan-starter --no-pager
sudo ipsec status
sudo ipsec statusall
sudo ss -lunp | grep -E ':500|:4500'

A successful tunnel should display an active IKE Security Association and an installed Child Security Association.

Connectivity Validation

Connectivity can be tested from the PNETLab network toward the AWS private host through the IPsec tunnel.

Example:

ping <AWS_PRIVATE_IP>

The AWS private IP should be masked before publishing terminal screenshots.

Traffic counters on the pfSense IPsec status page should increase after sending test traffic.

Verified Result

The pfSense IPsec dashboard confirmed:

Phase 1 state: Established
Phase 2 state: Installed
IKE protocol: IKEv2
AES-256 encryption enabled
SHA-256 integrity enabled
Bidirectional packets successfully transmitted
The PNETLab VLAN network successfully connected to the AWS EC2 private host

This confirms that the Site-to-Site IPsec VPN is operational.

