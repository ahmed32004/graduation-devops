# SSH Security Hardening

## Implemented Controls

- SSH key-based authentication
- Password authentication disabled
- Direct root login restricted
- Correct permissions for the Ubuntu user's SSH files

## Recommended Settings

```text
PasswordAuthentication no
PermitRootLogin prohibit-password
PubkeyAuthentication yes
```

## Permissions

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown -R ubuntu:ubuntu ~/.ssh
```

## Verification

```bash
sudo sshd -T | grep -E 'passwordauthentication|permitrootlogin|pubkeyauthentication'
sudo systemctl status ssh --no-pager
```

Do not upload private keys, `.pem`, `.ppk`, or `authorized_keys`.

## Screenshots Required

- `01-ssh-service-status.png`
- `02-sshd-effective-settings.png`
- `03-successful-key-login.png`
