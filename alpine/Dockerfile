FROM alpine:3.13.1
LABEL maintainer="Managed Kaos info@managedkaos"

WORKDIR /tmp

RUN apk add --no-cache \
        alpine-sdk \
        autoconf \
        automake \
        gettext \
        git \
        libtool \
        openssl \
        openssl-dev \
        linux-headers \
        python2 \
        rrdtool && \
    openssl req \
            -new \
            -newkey rsa:4096 \
            -days 365 \
            -nodes \
            -x509 \
            -subj "/C=US/ST=CA/L=Manhattan\ Beach/O=Managed\ Kaos/OU=Cherokee\ SSL/CN=localhost" \
            -keyout /etc/ssl/key.pem \
            -out /etc/ssl/crt.pem && \
    git clone https://github.com/cherokee/webserver.git . && \
    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var && \
    autoreconf -iv \
    make && \
    make install && \
    echo "<p style='text-align:center'>Built from $(git rev-parse --short HEAD) on $(date)</p>" > /version.txt && \
    cat /version.txt >> /var/www/index.html && \
    apk del \
        alpine-sdk \
        autoconf \
        automake \
        gettext \
        git \
        libtool \
        openssl && \
    rm -rvf /tmp/*

COPY cherokee.conf /etc/cherokee

EXPOSE 80 443 9090

CMD ["/usr/sbin/cherokee"]
