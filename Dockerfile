FROM alpine

RUN apk add -U openssl

WORKDIR /root

COPY update.sh .

HEALTHCHECK --interval=5m \
  CMD /bin/sh update.sh || exit 1
