FROM      ppande/java7:latest

# Install zookeeper
RUN       wget -q -O - http://www.us.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /usr/local
RUN       cp /usr/local/zookeeper-3.4.6/conf/zoo_sample.cfg /usr/local/zookeeper-3.4.6/conf/zoo.cfg
RUN       ln -s /usr/local/zookeeper-3.4.6 /usr/local/zookeeper
EXPOSE    2181 2888 3888

#RUN       export HOSTIP="$(resolveip -s $HOSTNAME)"

# Install kafka08
RUN       wget -q -O - http://mirror.olnevhost.net/pub/apache/kafka/0.8.1.1/kafka-0.8.1.1-src.tgz | tar -xzf - -C /usr/local
RUN       cd /usr/local/kafka-0.8.1.1-src && ./gradlew jar && cd -
RUN       ln -s /usr/local/kafka-0.8.1.1-src /usr/local/kafka
EXPOSE    9092

# Clean up
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*

ENTRYPOINT  /usr/local/zookeeper//bin/zkServer.sh start /usr/local/zookeeper/conf/zoo.cfg && /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties

