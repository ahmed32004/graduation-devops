# Verification Matrix

| Item | Result from supplied material | Evidence |
|---|---|---|
| Full PNETLab enterprise topology | Confirmed | `01-pnetlab-full-topology.png` |
| CORE-01 interfaces up | Confirmed from CLI output | Current CLI paste / config |
| CORE-01 default route to pfSense | Confirmed | `0.0.0.0/0 via 10.0.20.1` |
| OSPF remote VLAN routes | Confirmed | CORE-01 routing output |
| ISP uplink received DHCP address | Confirmed | `192.168.102.132` at capture time |
| pfSense WAN gateway | Confirmed | `10.0.50.1` |
| pfSense internal CORE gateway | Confirmed | `CORE01_GW = 10.0.20.2` |
| pfSense static routes VLAN10–40 | Confirmed | `04-pfsense-static-routes.png` |
| Automatic outbound NAT | Confirmed | `05-pfsense-outbound-nat.png` |
| LAN firewall allow rules VLAN10–40 | Confirmed | `06-pfsense-lan-firewall-rules.png` |
| IPsec firewall rules AWS → VLAN10–40 | Confirmed | `07-pfsense-ipsec-firewall-rules.png` |
| IKEv2 Phase 1 | **Established** | `09-pfsense-ipsec-status.png` |
| IPsec CHILD SA / Phase 2 | **Installed** | `09-pfsense-ipsec-status.png` |
| End-to-end VLAN-to-AWS ping | Not evidenced in supplied final screenshot set | Pending final data-plane test |
| AWS console / strongSwan status screenshot | Not supplied in this final evidence set | Not included |

## Final data-plane evidence still to add later

When the troubleshooting phase is resumed, add only successful or diagnostically useful evidence such as:

- Ping from the intended VLAN client to `172.31.42.241`
- pfSense IPsec counters increasing
- AWS XFRM / packet-capture confirmation

No such evidence is fabricated in this package.
