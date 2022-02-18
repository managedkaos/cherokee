FROM ubuntu
MAINTAINER Managed Kaos (info@managedkaos)
RUN apt-get update && apt-get -qq install git autoconf automake libtool libtool-bin python2 libssl-dev
RUN git clone https://github.com/cherokee/webserver.git
RUN cd webserver && ./autogen.sh --with-python2=/usr/bin/python2 && make && make install

EXPOSE 80 443 9090

CMD ["/usr/sbin/cherokee-worker"]
