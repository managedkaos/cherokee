FROM alpine

MAINTAINER Managed Kaos (info@managedkaos)

ENV PACKAGES "alpine-sdk \
     autoconf \
     automake \
     gettext \
     git \
     libtool \
     python2 \
     rrdtool"

RUN apk add --no-cache ${PACKAGES} && \
    cd /tmp && \
    git clone http://github.com/cherokee/webserver.git . && \ 
    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var && \
    make && \
    make install && \
    apk del ${PACKAGES} && \
    rm -rvf /tmp/*

EXPOSE 80 443 9090

CMD ["/usr/sbin/cherokee-worker"]

