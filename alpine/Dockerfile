# Stage 1: Build stage
FROM alpine:3.15.0 AS build
LABEL maintainer="Managed Kaos info@managedkaos"

WORKDIR /tmp

# Install build dependencies
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
        rrdtool

# Clone the repository and build
RUN git clone https://github.com/cherokee/webserver.git . && \
    /usr/bin/libtoolize && \
    aclocal && autoheader && touch ./ChangeLog ./README && autoconf && \
    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var && \
    autoreconf -iv && \
    make && make install && \
    echo "<p style='text-align:center'>Built from $(git rev-parse --short HEAD) on $(date)</p>" > /version.txt

# Stage 2: Minimal runtime image
FROM alpine:3.15.0
LABEL maintainer="Managed Kaos info@managedkaos"

# Copy necessary files from the build stage
COPY --from=build /usr /usr
COPY --from=build /etc /etc
COPY --from=build /var/www/index.html /var/www/index.html
COPY cherokee.conf /etc/cherokee
COPY --from=build /version.txt /version.txt

# Create SSL certificate directly in the runtime image
RUN apk add --no-cache openssl && \
    openssl req \
        -new \
        -newkey rsa:4096 \
        -days 365 \
        -nodes \
        -x509 \
        -subj "/C=US/ST=CA/L=Manhattan Beach/O=Managed Kaos/OU=Cherokee SSL/CN=localhost" \
        -keyout /etc/ssl/key.pem \
        -out /etc/ssl/crt.pem && \
    sed -i '/<\/body>/i <!-- Appended Version Info -->\n<p style="text-align:center">'"$(cat /version.txt)"'</p>' /var/www/index.html && \
    apk del openssl

WORKDIR /var/www
EXPOSE 80 443 9090

CMD ["/usr/sbin/cherokee"]
