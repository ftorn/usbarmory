FROM armhf/alpine
MAINTAINER ft

RUN apk update && \
    apk add tzdata && \
    apk add tor --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community && \
    rm -rf /var/cache/apk/*  

ENV HOME /home/tor
COPY ./torrc /etc/tor/

RUN mkdir $HOME && \
    chown -R tor $HOME && \
    cp /usr/share/zoneinfo/Europe/Rome /etc/localtime

USER tor
#EXPOSE 9040 53

ENTRYPOINT [ "tor" ]
CMD ["-f","/etc/tor/torrc"]
