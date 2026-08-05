# StrongSwan VPN Integration

## Purpose

StrongSwan provides encrypted IPsec communication between the external enterprise/lab network and the AWS server.

## Required Information

| Field | Value |
|---|---|
| VPN Type | `SITE_TO_SITE_OR_REMOTE_ACCESS` |
| Local Network CIDR | `TO_BE_PROVIDED` |
| Remote Network CIDR | `TO_BE_PROVIDED` |
| AWS Endpoint | `TO_BE_PROVIDED_OR_MASKED` |
| Remote Peer | `TO_BE_PROVIDED_OR_MASKED` |
| IKE Version | `IKEV1_OR_IKEV2` |
| Authentication | `PSK_OR_CERTIFICATE` |
| Encryption | `TO_BE_PROVIDED` |
| Integrity | `TO_BE_PROVIDED` |
| DH Group | `TO_BE_PROVIDED` |

## Validation

```bash
sudo systemctl status strongswan-starter --no-pager
sudo ipsec status
sudo ipsec statusall
sudo ss -lunp | grep -E ':500|:4500'
```

Do not upload `/etc/ipsec.secrets`, pre-shared keys, private certificates, or private keys.

## Screenshots Required

- `01-strongswan-service-status.png`
- `02-ipsec-tunnel-status.png`
- `03-vpn-connectivity-test.png`
