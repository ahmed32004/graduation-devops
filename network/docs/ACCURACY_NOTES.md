# Accuracy and Scope Notes

This repository package intentionally documents the network **as supplied**, without silently correcting or inventing configuration.

## Preserved observations

- The current CORE-01 configuration contains the working DHCP pools `HR`, `IT`, `ENG`, and `SALES`.
- It also contains additional pools named `VLAN10-HR` and `VLAN20-IT` without `network` statements. These are preserved in `CORE-01-current.cfg`; this package does not modify the running router configuration.
- `show ip dhcp binding` returned no bindings at the instant of the supplied CLI capture. This is recorded as an observation only and is not interpreted as a DHCP failure.
- The supplied pfSense static routes and IPsec selectors cover VLANs 10–40.
- VLANs 50–80 exist in the wider PNETLab campus topology and are visible in OSPF routing, but are not shown in the current pfSense IPsec selector screenshots.
- AWS console screenshots were not supplied in this evidence set, so no AWS console screenshot has been fabricated or substituted.

## Sanitization

The original PNETLab export contained embedded IOS credential hashes and line passwords. The original export is **not included** in this GitHub-ready package.

Instead, this repository contains:

- Sanitized individual IOS configuration files.
- A sanitized `.unl` lab file.
- A sanitized PNETLab import ZIP.

The actual IPsec PSK is also excluded.
