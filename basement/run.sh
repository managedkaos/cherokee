#!/bin/bash
#docker run -d -p 80:80 -p 9090:9090 managedkaos/cherokee:alpine
source config.txt

case "$1" in
    a*) echo "Running Alpine..."; 
        target=alpine;
        port_80=$alpine_80;
        port_443=$alpine_443;
        port_9090=$alpine_9090;
        ;;
    c*) echo "Running CentOS...";
        target=centos;
        port_80=$centos_80;
        port_443=$centos_443;
        port_9090=$centos_9090;
        ;;
    f*) echo "Running Fedora...";
        target=fedora;
        port_80=$fedora_80;
        port_443=$fedora_443;
        port_9090=$fedora_9090;
        ;;
    u*) echo "Running Ubuntu...";
        target=ubuntu;
        port_80=$ubuntu_80;
        port_443=$ubuntu_443;
        port_9090=$ubuntu_9090;
        ;;
    *) echo "Don't know how to run $1 :("; exit 1;;
esac

docker run -d -p ${port_80}:80 -p ${port_443}:443 -p $port_9090:9090 managedkaos/cherokee:${target}
