#!/bin/bash

echo $MYID is my id

# wait until docker-compose gets another zookeeper container running
# partially to start up the zookeeper cluster.
((count = 10))
while [[ $count -ne 0 ]]
do
    for host in 'zookeeper1' 'zookeeper2' 'zookeeper3'
    do
        if [ host == "zookeeper"$MYID ]
        then
            continue
        fi
        ping -c 1 $host
        rc=$?
        if [[ $rc -eq 0 ]] ; then
            mkdir -p /var/zookeeper
            echo $MYID > /var/zookeeper/myid
            /opt/zookeeper/bin/zkServer.sh start-foreground
            exit 0
        fi
        sleep 1
        ((count = count - 1))
    done
done

echo another zookeeper never ready for zookeeper$MYID
exit 1
