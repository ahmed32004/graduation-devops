# Routing and OSPF

## OSPF

The PNETLab router configurations use OSPF process `1`, Area `0`.

| Router | Router ID |
|---|---|
| CORE-01 | `1.1.1.1` |
| CORE-02 | `2.2.2.2` |
| CORE-03 | `3.3.3.3` |
| CORE-04 | `4.4.4.4` |
| ISP | `5.5.5.5` |

## CORE-01 observed routing state

The supplied `show ip route` output confirms:

- Default route: `0.0.0.0/0 via 10.0.20.1` (pfSense)
- Directly connected local VLANs:
  - `192.168.10.0/24`
  - `192.168.20.0/24`
  - `192.168.30.0/24`
  - `192.168.40.0/24`
- OSPF-learned remote VLANs:
  - `192.168.50.0/24`
  - `192.168.60.0/24`
  - `192.168.70.0/24`
  - `192.168.80.0/24`
- OSPF-learned core transit networks include `10.0.13.0/24`, `10.0.14.0/24`, and `10.0.15.0/24`.

## ECMP visible on CORE-01

The supplied route table shows equal-cost OSPF next hops for several transit networks, for example:

- `10.0.13.0/24` via CORE-03 and CORE-02 paths
- `10.0.14.0/24` via CORE-04 and CORE-02 paths
- `10.0.15.0/24` via CORE-04 and CORE-03 paths

This documents the multi-core routing structure visible in the lab.

## ISP routing

At capture time:

- Connected: `10.0.50.0/30`
- Connected: `10.0.30.0/24`
- Connected upstream network: `192.168.102.0/24`
- Default route: `0.0.0.0/0 via 192.168.102.2`

The ISP configuration also performs NAT overload on its DHCP-facing interface `Ethernet0/2`.

## pfSense static routing

The supplied pfSense screenshot shows four static routes, all via `CORE01_GW (10.0.20.2)`:

- `192.168.10.0/24`
- `192.168.20.0/24`
- `192.168.30.0/24`
- `192.168.40.0/24`

The supplied pfSense evidence does not show static routes for VLANs 50–80.
