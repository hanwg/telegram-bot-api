ARG BUILD_NAME="Home Assistant Addon: Telegram Bot API"
ARG BUILD_DESCRIPTION="Docker image for Telegram Bot API. Built for Home Assistant as an addon."
ARG BUILD_VERSION="9.3"

# build from source

FROM alpine AS build

RUN \
  apk update && \
  apk upgrade && \
  apk add alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake && \
  git clone --recursive https://github.com/tdlib/telegram-bot-api.git && \
  cd telegram-bot-api && \
  rm -rf build && \
  mkdir build && \
  cd build && \
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. && \
  cmake --build . --target install

# copy built binaries to final image

ARG BUILD_FROM
FROM $BUILD_FROM
COPY --from=build /usr/local/bin/telegram-bot-api /usr/local/bin/telegram-bot-api

ARG BUILD_NAME
ARG BUILD_DESCRIPTION
ARG BUILD_ARCH
ARG BUILD_VERSION
LABEL \
  io.hass.name="${BUILD_NAME}" \
  io.hass.description="${BUILD_DESCRIPTION}" \
  io.hass.arch="${BUILD_ARCH}" \
  io.hass.type="addon" \
  io.hass.version=${BUILD_VERSION} \
  maintainer="hanwg (https://github.com/hanwg)" \
  org.opencontainers.image.title="${BUILD_NAME}" \
  org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
  org.opencontainers.image.authors="hanwg (https://github.com/hanwg)" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="https://github.com/hanwg/telegram-bot-api" \
  org.opencontainers.image.documentation="https://github.com/hanwg/telegram-bot-api/blob/main/README.md" \
  org.opencontainers.image.version=${BUILD_VERSION}