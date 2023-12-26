#!/usr/bin/env bash

QBT_ENH_VERSION=$(curl -sL "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases" \
      | awk '/tag_name/{print $4;exit}' FS='[""]')
echo "qBittorrent-Enhanced-Edition version: ${QBT_ENH_VERSION}"

echo "Target architecture: ${TARGETARCH}"

if [ "$TARGETARCH" = "arm64" ]; then
  URL="https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/${QBT_ENH_VERSION}/qbittorrent-enhanced-nox_aarch64-linux-musl_static.zip"
  echo "Downloading qBittorrent-Enhanced-Edition for ARM64"
elif [ "$TARGETARCH" = "amd64" ]; then
  URL="https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/${QBT_ENH_VERSION}/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"
  echo "Downloading qBittorrent-Enhanced-Edition for AMD64"
else
  echo "Unsupported architecture: ${TARGETARCH}"
  exit 1
fi

echo "Downloading from URL ${URL}"

wget -O ./qbtenh.zip "${URL}"
