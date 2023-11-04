Dockerhub: https://hub.docker.com/r/tlan16/qbittorrent-enhanced

Dockerfile: https://github.com/tlan16/docker-qbittorrent-enhanced-edition/blob/main/Dockerfile

Docker compose:

```yaml
---
version: "3.9"
services:
  qbittorrent:
    image: tlan16/qbittorrent-enhanced:latest
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - WEBUI_PORT=8080
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 8080:8080
      - 6881:6881
      - 6881:6881/udp
    restart: unless-stopped
```
