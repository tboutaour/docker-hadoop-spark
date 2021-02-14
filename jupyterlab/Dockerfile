FROM ubuntu:20.04

WORKDIR /root

RUN apt-get update && apt-get install -y openssh-server openjdk-8-jdk wget iputils-ping telnet dnsutils

COPY config/requirements.txt /etc/requirements.txt

RUN apt-get update -y && \
    apt-get install -y python3-pip

RUN pip3 install -r /etc/requirements.txt

EXPOSE 8888
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
