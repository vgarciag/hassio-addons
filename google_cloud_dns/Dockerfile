ARG BUILD_FROM=ghcr.io/hassio-addons/base:16.0.0
FROM $BUILD_FROM

# Setup base
ARG DEHYDRATED_VERSION=0.7.1
RUN apk add --no-cache jq openssl \
  && curl -s -o /usr/bin/dehydrated \
    "https://raw.githubusercontent.com/lukas2511/dehydrated/v${DEHYDRATED_VERSION}/dehydrated" \
  && chmod a+x /usr/bin/dehydrated

# dehydrated scripts are also copied into own gist as a backup: https://gist.github.com/vgarciag

# Copy data
COPY rootfs /
