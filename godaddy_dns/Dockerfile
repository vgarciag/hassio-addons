ARG BUILD_FROM
FROM $BUILD_FROM

# Setup base
ARG DEHYDRATED_VERSION
RUN apk add --no-cache openssl \
  && curl -s -o /usr/bin/dehydrated \
    "https://raw.githubusercontent.com/lukas2511/dehydrated/v${DEHYDRATED_VERSION}/dehydrated" \
  && chmod a+x /usr/bin/dehydrated

# dehydrated 0.7.0 has been copied into own gist: https://gist.githubusercontent.com/vgarciag/f3da2ce655d50f1af3c990be999c8add/raw/ec32a6b277bf4a72bdc105affd1c7543d90da4c3/dehydrated
# Copy data
COPY rootfs /
