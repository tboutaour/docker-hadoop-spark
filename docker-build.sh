#!/bin/bash#

# create base spark cluster docker image
docker build -f spark/base/Dockerfile -t tonibous/spark-cluster-base:latest spark/base

# create master node spark cluster docker image
docker build -f spark/master/Dockerfile -t tonibous/spark-cluster-master:latest spark/master

# create master node spark cluster docker image
docker build -f spark/worker/Dockerfile -t tonibous/spark-cluster-worker:latest spark/worker

# create master driver spark cluster docker image
docker build -f spark/driver/Dockerfile -t tonibous/spark-cluster-driver:latest spark/driver

# create base hadoop cluster docker image
docker build -f hadoop/base/Dockerfile -t tonibous/hadoop-cluster-base:latest hadoop/base

# create master node hadoop cluster docker image
docker build -f hadoop/master/Dockerfile -t tonibous/hadoop-cluster-master:latest hadoop/master

# create jupyterlab image
docker build -f jupyterlab/Dockerfile -t tonibous/jupyterlab:latest jupyterlab