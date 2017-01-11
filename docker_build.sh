#!/bin/bash 
for i in alpine centos fedora ubuntu;
do
    docker build -t "managedkaos/cherokee:${i}" -f ./${i}/Dockerfile .
done

