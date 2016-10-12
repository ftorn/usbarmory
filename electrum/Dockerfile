FROM armhf/alpine
MAINTAINER ft

RUN apk update && \
    apk add tzdata && \
    apk add python python-dev py-pip build-base && \
    rm -rf /var/cache/apk/*  

RUN pip install https://download.electrum.org/2.7.4/Electrum-2.7.4.tar.gz

ENTRYPOINT ["electrum"]
CMD ["--help"]
