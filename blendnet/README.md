# Manager

```yaml
version: "3.8"
services:
  bn-manager:
    image: ghcr.io/satcom886/blendnet-manager:latest
    restart: unless-stopped
    volumes:
      - /srv/docker_storage/blendnet:/workdir
    ports:
      - 7443:8443
```

# Worker

```yaml
version: "3.8"
services:
  bn-agent:
    image: ghcr.io/satcom886/blendnet-agent:latest
    restart: unless-stopped
    volumes:
      - server.key:/workdir/server.key
    ports:
      - 9443:9443
```
