FROM tonibous/spark-cluster-base

WORKDIR /root

ARG DEBIAN_FRONTEND=noninteractive

ADD config/start.sh /etc/start.sh
RUN chown root:root /etc/start.sh
RUN chmod 700 /etc/start.sh

ENV START /etc/start.sh

CMD ["/etc/start.sh", "-d"]