#!/bin/bash 
for i in alpine centos fedora ubuntu;
do
    docker build -t "managedkaos/cherokee:${i}" ./${i}
done

