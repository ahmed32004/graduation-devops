# IP Addressing Plan

## Department VLANs

| VLAN | Department | Network | Default gateway | Gateway device |
|---:|---|---|---|---|
| 10 | HR | `192.168.10.0/24` | `192.168.10.1` | CORE-01 |
| 20 | IT | `192.168.20.0/24` | `192.168.20.1` | CORE-01 |
| 30 | Engineering | `192.168.30.0/24` | `192.168.30.1` | CORE-01 |
| 40 | Sales | `192.168.40.0/24` | `192.168.40.1` | CORE-01 |
| 50 | Development | `192.168.50.0/24` | `192.168.50.1` | CORE-02 |
| 60 | Operations | `192.168.60.0/24` | `192.168.60.1` | CORE-02 |
| 70 | Marketing | `192.168.70.0/24` | `192.168.70.1` | CORE-02 |
| 80 | Support | `192.168.80.0/24` | `192.168.80.1` | CORE-02 |

## Core transit networks

| Network | Endpoint A | Endpoint B |
|---|---|---|
| `10.0.10.0/24` | CORE-01 `10.0.10.1` | CORE-02 `10.0.10.2` |
| `10.0.11.0/24` | CORE-01 `10.0.11.1` | CORE-03 `10.0.11.2` |
| `10.0.12.0/24` | CORE-01 `10.0.12.1` | CORE-04 `10.0.12.2` |
| `10.0.13.0/24` | CORE-02 `10.0.13.1` | CORE-03 `10.0.13.2` |
| `10.0.14.0/24` | CORE-02 `10.0.14.1` | CORE-04 `10.0.14.2` |
| `10.0.15.0/24` | CORE-03 `10.0.15.1` | CORE-04 `10.0.15.2` |

## Firewall / ISP transit

| Segment | Device | Address |
|---|---|---|
| pfSense ↔ CORE-01 | pfSense LAN | `10.0.20.1/30` |
| pfSense ↔ CORE-01 | CORE-01 E1/1 | `10.0.20.2/30` |
| ISP ↔ pfSense | ISP E0/0 | `10.0.50.1/30` |
| ISP ↔ pfSense | pfSense WAN | `10.0.50.2/30` |
| ISP internal transit | ISP E0/1 | `10.0.30.1/24` |
| ISP internal transit | CORE-02 E1/1 (export snapshot) | `10.0.30.2/24` |

## Upstream / host-side network

At the CLI capture time, ISP `Ethernet0/2` received:

- `192.168.102.132/24` by DHCP
- Default gateway: `192.168.102.2`

Because this address is DHCP-assigned, it should be treated as a capture-time value rather than a permanent design address.

## AWS IPsec peer

- Public VPN peer: `16.192.74.74`
- Protected AWS host: `172.31.42.241/32`
