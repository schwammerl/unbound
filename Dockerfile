FROM alpine:latest

RUN apk update \
    && apk add \
      libressl \
      unbound \
      wget \
    && rm -rf /var/cache/apk/*

COPY unbound.conf /etc/unbound/unbound.conf
COPY unbound.sh /usr/local/sbin/unbound.sh

# RUN adduser -S unbound
RUN chmod +x /usr/local/sbin/unbound.sh
RUN /usr/local/sbin/unbound.sh

EXPOSE 53/udp
EXPOSE 8953/tcp

CMD [ "/usr/sbin/unbound", "-d", "-c", "/etc/unbound/unbound.conf" ]
