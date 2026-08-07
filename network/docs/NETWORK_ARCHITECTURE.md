# Network Architecture

## Overview

The lab models an enterprise network in PNETLab with four Layer-3 core nodes, four access switches, eight departmental VLANs, an ISP edge, pfSense, and a cloud IPsec peer.

The first four VLANs (10–40) are currently the networks explicitly routed by pfSense and included in the supplied IPsec Phase 2 selectors. VLANs 50–80 are present in the wider PNETLab campus topology and are learned across the core through OSPF, but they are **not shown as pfSense IPsec selectors in the supplied screenshots**.

## Logical architecture

```mermaid
flowchart TB
    NET["PNETLab Net / Upstream"]
    DOCKER["Docker node"]
    ISP["ISP Router"]
    PFS["pfSense-FW"]
    AWS["AWS strongSwan peer\nPublic: 16.192.74.74\nProtected host: 172.31.42.241/32"]

    C1["CORE-01 HQ\nRID 1.1.1.1"]
    C2["CORE-02 HQ\nRID 2.2.2.2"]
    C3["CORE-03 HQ\nRID 3.3.3.3"]
    C4["CORE-04 HQ\nRID 4.4.4.4"]

    B1["SW-L-01 B1\nVLAN10 HR / VLAN20 IT"]
    B2["SW-L-02 B2\nVLAN30 ENG / VLAN40 SALES"]
    B3["SW-R-01 B3\nVLAN50 DEV / VLAN60 OPS"]
    B4["SW-R-02 B4\nVLAN70 MKT / VLAN80 SUP"]

    NET --- ISP
    NET --- DOCKER
    ISP --- PFS
    PFS --- C1
    PFS -. "IKEv2 IPsec / NAT-T" .- AWS

    C1 --- C2
    C1 --- C3
    C1 --- C4
    C2 --- C3
    C2 --- C4
    C3 --- C4

    C1 --- B1
    C3 --- B1
    C1 --- B2
    C3 --- B2
    C2 --- B3
    C4 --- B3
    C2 --- B4
    C4 --- B4
```

## Access groups visible in the PNETLab topology

| Access block | Department | VLAN | Client labels |
|---|---|---:|---|
| B1 | HR | 10 | HR-PC-01, HR-PC-02 |
| B1 | IT | 20 | IT-PC-01, IT-PC-02 |
| B2 | Engineering | 30 | ENG-PC-01, ENG-PC-02 |
| B2 | Sales | 40 | SALES-PC-01, SALES-PC-02 |
| B3 | Development | 50 | DEV-PC-01, DEV-PC-02 |
| B3 | Operations | 60 | OPS-PC-01, OPS-PC-02 |
| B4 | Marketing | 70 | MKT-PC-01, MKT-PC-02 |
| B4 | Support | 80 | SUP-PC-01, SUP-PC-02 |

## Primary evidence

![PNETLab full topology](../evidence/screenshots/01-pnetlab-full-topology.png)
