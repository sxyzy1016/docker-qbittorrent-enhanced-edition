FROM alpine as download

ARG TARGETARCH
ENV TARGETVARIANT=${TARGETVARIANT}

WORKDIR /download
RUN apk add --no-cache unzip wget bash curl
COPY ./scripts/download.sh /download/download.sh

RUN bash /download/download.sh
RUN ls -alh /download

FROM linuxserver/qbittorrent:latest

ARG TARGETVARIANT

COPY --from=download /download/qbtenh.zip /tmp/qbtenh.zip
RUN apk add --no-cache unzip && \
    cd /tmp && \
    unzip ./qbtenh.zip && \
    mv ./qbittorrent-nox /usr/bin && \
    chmod +x /usr/bin/qbittorrent-nox && \
    rm -rf ./* && \
    apk del --purge unzip

ADD ./download-vuetorrent.sh download-vuetorrent.sh
RUN sh ./download-vuetorrent.sh && \
    unzip vuetorrent.zip && \
    rm -f vuetorrent.zip download-vuetorrent.sh

HEALTHCHECK CMD curl -f --head http://localhost:8080
