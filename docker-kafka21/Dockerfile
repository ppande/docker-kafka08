FROM 	  kaiwinter/docker-java8-maven

# Install zookeeper
RUN       wget -q -O - http://www.us.apache.org/dist/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz | tar -xzf - -C /usr/local
RUN       cp /usr/local/zookeeper-3.4.14/conf/zoo_sample.cfg /usr/local/zookeeper-3.4.14/conf/zoo.cfg
RUN       ln -s /usr/local/zookeeper-3.4.14 /usr/local/zookeeper
EXPOSE    2181 2888 3888

#RUN       export HOSTIP="$(resolveip -s $HOSTNAME)"

# Install kafka08
ENV	  ALLOW_PLAINTEXT_LISTENER=yes
RUN       wget -q -O - http://apache.mirrors.hoobly.com/kafka/2.1.1/kafka_2.11-2.1.1.tgz | tar -xzf - -C /usr/local
RUN       ln -s /usr/local/kafka_2.11-2.1.1 /usr/local/kafka
EXPOSE    9092

# Clean up
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*

ENTRYPOINT  /usr/local/zookeeper//bin/zkServer.sh start /usr/local/zookeeper/conf/zoo.cfg && /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties

