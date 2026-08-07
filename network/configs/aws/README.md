# AWS IPsec Endpoint

The supplied pfSense evidence identifies the cloud VPN peer as:

- Public VPN peer: `16.192.74.74`
- Protected AWS host: `172.31.42.241/32`
- VPN implementation: strongSwan / IKEv2
- NAT traversal: active (`UDP/4500`) in the supplied status screenshot

The AWS-side screenshots are not included in the supplied evidence set, so this directory intentionally contains only the sanitized strongSwan configuration template already used for the lab and no claims about AWS console settings beyond the VPN endpoint information above.

Never commit the actual `/etc/ipsec.secrets`, AWS access keys, or an EC2 SSH private key.
