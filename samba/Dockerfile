FROM armhf/alpine
MAINTAINER ft

ENV USERNAME="usbarmory" PASS="usbarmory"

RUN apk update && apk upgrade
RUN apk add samba samba-common-tools supervisor && rm -rf /var/cache/apk/* && \
    rm -rf /var/cache/apk/* && \ 
    mkdir /config /shared

COPY *.conf /config/

RUN addgroup -g 1000 $USERNAME && \
    adduser -D -H -G $USERNAME -s /bin/false -u 1000 $USERNAME && \
    echo -e "$PASS\n$PASS" | smbpasswd -a -s -c /config/smb.conf $USERNAME && \
    echo "write list = $USERNAME" >> /config/smb.conf

EXPOSE 137/udp 138/udp 139 445

ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
