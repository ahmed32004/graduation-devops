# Security Policy for This Academic Repository

The supplied network material was sanitized before packaging for GitHub.

## Removed / excluded

- Cisco `enable secret` hashes
- Local Cisco username secret hashes
- Console / VTY passwords
- IPsec pre-shared key
- AWS SSH private keys
- AWS access keys / secret keys
- Full pfSense `config.xml`
- Original unsanitized PNETLab export

## Safe placeholders

The repository uses placeholders such as:

- `<AWS_ELASTIC_IP>`
- `<IPSEC_PSK>`

## Important

Do not commit the original PNETLab export supplied before sanitization. It contained embedded device credentials.
