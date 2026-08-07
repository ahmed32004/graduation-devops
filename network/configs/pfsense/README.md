# pfSense Configuration Summary

This file documents only settings visible in the supplied pfSense screenshots and the established addressing used by the lab.

## Interfaces

| Logical interface | Port | Address / role |
|---|---|---|
| WAN | `vtnet0` | `10.0.50.2/30` toward ISP |
| LAN | `vtnet1` | `10.0.20.1/30` toward CORE-01 |
| Unassigned | `vtnet2` | Available / not assigned in supplied screenshot |

## Gateways

| Gateway | Interface | Address | Notes |
|---|---|---|---|
| `WAN_DHCP` | WAN | `10.0.50.1` | WAN DHCP gateway entry |
| `WANGW` | WAN | `10.0.50.1` | Default IPv4 gateway |
| `CORE01_GW` | LAN | `10.0.20.2` | Internal CORE-01 gateway |

## Static routes

All four routes below use `CORE01_GW (10.0.20.2)`:

- `192.168.10.0/24` — VLAN10 HR
- `192.168.20.0/24` — VLAN20 IT
- `192.168.30.0/24` — VLAN30 ENG
- `192.168.40.0/24` — VLAN40 SALES

## Outbound NAT

The supplied screenshot shows **Automatic outbound NAT** enabled.

## LAN firewall policy visible in evidence

Explicit IPv4 allow rules exist for:

- `192.168.10.0/24`
- `192.168.20.0/24`
- `192.168.30.0/24`
- `192.168.40.0/24`

The screenshot also contains the default LAN-to-any rules.

## IPsec firewall policy visible in evidence

Inbound decrypted traffic is explicitly permitted from AWS host `172.31.42.241` to:

- `192.168.10.0/24`
- `192.168.20.0/24`
- `192.168.30.0/24`
- `192.168.40.0/24`

No pfSense XML backup is included because a full `config.xml` may contain sensitive credentials, certificates, or VPN secrets.
