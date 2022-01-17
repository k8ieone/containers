# Quick start
Easiest way to start is by using `docker-compose`

```yaml
version: "3.8"
services:
  repo:
    image: ghcr.io/satcom886/arch-repo:latest
    environment:
      WEBDAV_USER: user
      WEBDAV_PASSWORD: changeme
      REPO_NAME: custom
    volumes:
      - /home/oooo/:/packages
    ports:
      # HTTP port where the repo will be accessible
      - 8080:8080
      # WebDAV port which you can use to upload packages
      - 8081:8081
```
