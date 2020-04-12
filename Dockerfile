FROM alpine

RUN apk add --no-cache openssl

WORKDIR /root

COPY update.sh .

HEALTHCHECK --interval=5m \
  CMD /bin/sh update.sh || exit 1
