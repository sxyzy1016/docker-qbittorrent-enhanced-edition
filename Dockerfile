From linuxserver/qbittorrent:latest

ARG QBT_ENH_VERSION

RUN apk add --no-cache unzip wget && \
    cd /tmp && \
    QBT_ENH_VERSION=$(curl -sL "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases" \
      | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    wget -O ./qbtenh.zip \
      https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/${QBT_ENH_VERSION}/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip && \
    unzip ./qbtenh.zip && \
    mv ./qbittorrent-nox /usr/bin && \
    chmod +x /usr/bin/qbittorrent-nox && \
    rm -rf ./* && \
    apk del --purge unzip wget
    
