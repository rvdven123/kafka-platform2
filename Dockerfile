FROM quay.io/strimzi/kafka:0.33.1-kafka-3.3.2
USER root:root
COPY ./plugins/ /opt/kafka/plugins/

RUN cd /opt/kafka/plugins/ && \
    unzip confluentinc-kafka-connect-jdbc-10.6.3.zip && \
    tar xvf debezium-connector-postgres-2.1.2.Final-plugin.tar.gz && \
    unzip debezium-debezium-connector-mysql-2.0.1.zip

COPY ./debezium/target/*.jar /opt/kafka/plugins/confluentinc-kafka-connect-jdbc-10.6.3/lib/

RUN cd /opt/kafka/plugins && unzip confluentinc-kafka-connect-avro-converter-7.3.2.zip -d /tmp && mv /tmp/confluentinc-kafka-connect-avro-converter-7.3.2/lib/*.jar /opt/kafka/libs/

USER 1001