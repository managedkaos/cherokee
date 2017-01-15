FROM centos
MAINTAINER Managed Kaos (info@managedkaos)
RUN yum update -y && \
    yum groupinstall -y "Development Tools" && \
    git clone http://github.com/cherokee/webserver.git
WORKDIR /webserver
RUN ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var && \
    make && make install
WORKDIR /

EXPOSE 80 443 9090

CMD ["/usr/sbin/cherokee-worker"]

