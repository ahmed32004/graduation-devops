# DevOps Automation for IoT Device Deployment Using AI

## Network & Cloud Infrastructure — documented stage

This repository package contains the **network infrastructure portion** of the graduation project. It is prepared as a reviewable GitHub structure with configuration, topology, security sanitization, and screenshot evidence.

> Scope note: this package focuses on the network layer. Docker Compose, MQTT/Node-RED/InfluxDB/Grafana, CI/CD, Telegram alerts, and the AI/anomaly-detection layer are intentionally outside this upload and can be added later.

## What is documented

- PNETLab enterprise topology
- Four-core OSPF campus design
- Eight departmental VLANs
- DHCP and router-on-a-stick gateway configuration
- ISP routing and NAT
- pfSense interfaces, gateways, static routes, firewall policy, and outbound NAT
- pfSense ↔ AWS strongSwan IKEv2 IPsec configuration
- Sanitized PNETLab export
- Supplied screenshot evidence
- Verification matrix showing what is proven and what remains pending

## Current VPN status evidenced by screenshots

- IKEv2 Phase 1: **Established**
- CHILD SA / Phase 2: **Installed**
- NAT-T: active
- Local protected networks in current IPsec scope:
  - `192.168.10.0/24`
  - `192.168.20.0/24`
  - `192.168.30.0/24`
  - `192.168.40.0/24`
- AWS protected host: `172.31.42.241/32`

The supplied status screenshot was captured with packet counters at zero. Accordingly, this repository **does not claim final end-to-end data-plane validation yet**.

## Repository structure

```text
network/
├── configs/
│   ├── aws/
│   ├── cisco/
│   └── pfsense/
├── docs/
│   ├── ACCURACY_NOTES.md
│   ├── IP_ADDRESSING.md
│   ├── NETWORK_ARCHITECTURE.md
│   ├── PFSENSE_IPSEC.md
│   └── ROUTING_AND_OSPF.md
├── evidence/
│   ├── README.md
│   └── screenshots/
├── lab/
│   ├── Graduation-Project-without-HSRP-sanitized.unl
│   └── PNETLab-export-sanitized.zip
└── tests/
    └── VERIFICATION_MATRIX.md
```

## Start here

1. [Network Architecture](network/docs/NETWORK_ARCHITECTURE.md)
2. [IP Addressing Plan](network/docs/IP_ADDRESSING.md)
3. [Routing and OSPF](network/docs/ROUTING_AND_OSPF.md)
4. [pfSense and IPsec](network/docs/PFSENSE_IPSEC.md)
5. [Screenshot Evidence](network/evidence/README.md)
6. [Verification Matrix](network/tests/VERIFICATION_MATRIX.md)
7. [Accuracy / Scope Notes](network/docs/ACCURACY_NOTES.md)

## Security

Real credential hashes, IOS line passwords, AWS private keys, and the IPsec PSK are not included. See [SECURITY.md](SECURITY.md).
