# Master

```yaml
version: "3.8"
services:
  bn-master:
    image: ghcr.io/satcom886/blendnet-master:latest
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
  bn-worker:
    image: ghcr.io/satcom886/blendnet-worker:latest
    restart: unless-stopped
    ports:
      - 9443:9443
```
