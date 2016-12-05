#!/bin/bash

while true
do
    for host in 'zookeeper1' 'zookeeper2' 'zookeeper3'
    do
        ping -c 1 $host
        rc=$?
        if [[ $rc -eq 0 ]] ; then
            echo stat | nc $host 2181
        fi
    done
    sleep 10
done
