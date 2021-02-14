FROM tonibous/spark-cluster-base

WORKDIR /root
# Set default environment variables. These can also be set at the command line when invoking /bin/spark-submit
ENV MASTER_CONTAINER_NAME=spark-master

# Install libraries
COPY config/requirements.txt /etc/requirements.txt
RUN pip3 install -r /etc/requirements.txt

# Copy examples python files into container
COPY config/log4j.properties config/spark-defaults.conf $SPARK_HOME/conf/

EXPOSE 4040 8888