FROM alpine

MAINTAINER Managed Kaos (info@managedkaos)

WORKDIR /tmp

RUN apk add --no-cache \
        alpine-sdk \
        autoconf \
        automake \
        gettext \
        git \
        libtool \
        linux-headers \
        openssl \
        openssl-dev \
        php5-fpm \
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
    make && \
    make install && \
    apk del \
        alpine-sdk \
        autoconf \
        automake \
        gettext \
        git \
        libtool \
        openssl && \
    rm -vf /var/www/index.html && \
    rm -rvf /tmp/*

COPY index.php /var/www
COPY cherokee.conf /etc/cherokee

EXPOSE 80 443 9090

CMD ["/usr/sbin/cherokee"]
