From linuxserver/qbittorrent:latest

ARG QBT_ENH_VERSION

RUN apk add --no-cache unzip && \
    cd /tmp && \
    QBT_ENH_VERSION=$(curl -sL "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases" \
      | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    curl -o ./qbtenh.zip \
      https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/${QBT_ENH_VERSION}/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip && \
    unzip ./qbtenh.zip && \
    mv ./qbttorrent-nox /usr/bin && \
    chmod +x /usr/bin/qbittorrent && \
    rm -rf ./* && \
    apl del --purge unzip
    
