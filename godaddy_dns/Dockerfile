ARG BUILD_FROM
FROM $BUILD_FROM

# Setup base
ARG DEHYDRATED_VERSION
RUN apk add --no-cache openssl \
  && curl -s -o /usr/bin/dehydrated \
    "https://raw.githubusercontent.com/lukas2511/dehydrated/v${DEHYDRATED_VERSION}/dehydrated" \
  && chmod a+x /usr/bin/dehydrated

# dehydrated scripts are also copied into own gist as a backup: https://gist.github.com/vgarciag
# Copy data
COPY rootfs /
