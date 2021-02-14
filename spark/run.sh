#!/bin/bash

# create base spark cluster docker image
docker build -f base/Dockerfile -t tonibous/spark-cluster-base:latest base

# create master node spark cluster docker image
docker build -f master/Dockerfile -t tonibous/spark-cluster-master:latest master

# create master node spark cluster docker image
docker build -f worker/Dockerfile -t tonibous/spark-cluster-worker:latest worker

# create master driver spark cluster docker image
docker build -f driver/Dockerfile -t tonibous/spark-cluster-driver:latest driver

# the default node number is 3
N=${1:-3}

docker network create --driver=bridge spark &> /dev/null

# start spark master container
docker rm -f spark-master &> /dev/null
echo "start spark-master container..."
docker run -itd \
                --net=hadoop \
                -p 8080:8080 \
                -p 7077:7077 \
                --name spark-master \
                --hostname spark-master \
                tonibous/spark-cluster-master

# start spark worker container
i=1
docker rm -f spark-worker$i &> /dev/null
echo "start spark-worker$i container..."
docker run -itd \
                --net=hadoop \
                -p 8081:8081 \
                --name spark-worker$i \
                --hostname spark-worker$i \
                tonibous/spark-cluster-worker

# start spark worker container
docker rm -f spark-driver &> /dev/null
echo "start spark-driver container..."
docker run -itd \
                --net=hadoop \
                -p 4040:4040 \
                --name spark-driver \
                --hostname spark-driver \
                tonibous/spark-cluster-driver bash

# get into hadoop master container
docker exec -it spark-master bash
