#!/usr/bin/env sh

getReleaseUrl() {
  owner="$1"
  repo="$2"
  apiUrl="https://api.github.com/repos/$owner/$repo/releases/latest"
  curl --silent "$apiUrl" | grep browser_ | cut -d\" -f4
}

url=$(getReleaseUrl "WDaan" "VueTorrent")
echo "url: $url"

wget -O ./vuetorrent.zip "$url"
