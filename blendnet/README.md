# Manager

```yaml
version: "3.8"
services:
  bn-manager:
    image: ghcr.io/k8ieone/blendnet-manager:latest
    restart: unless-stopped
    volumes:
      - /var/run/avahi-daemon/socket:/var/run/avahi-daemon/socket
      - /srv/docker_storage/blendnet:/workdir
    ports:
      - 7443:8443
```

# Worker

```yaml
version: "3.8"
services:
  bn-agent:
    image: ghcr.io/k8ieone/blendnet-agent:latest
    restart: unless-stopped
    volumes:
      - ./ca.key:/workdir/ca.key:ro
      - ./ca.crt:/workdir/ca.crt:ro
    ports:
      - 9443:9443
```
