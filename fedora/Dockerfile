FROM fedora

MAINTAINER Managed Kaos (info@managedkaos)

RUN dnf -y install \
        autoconf \
        automake \
        gettext \
        git \
        libtool \
        openssl \
        openssl-devel \
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
    git clone https://github.com/cherokee/webserver.git /tmp/webserver

WORKDIR /tmp/webserver

    RUN ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var && \
    make && \
    make install && \
    rm -rvf /tmp/webserver

COPY cherokee.conf /etc/cherokee

EXPOSE 80 443 9090

CMD ["/usr/sbin/cherokee-worker"]
