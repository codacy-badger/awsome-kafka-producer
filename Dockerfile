FROM centos:centos7

ARG BUILD_DATE
ARG JAVA_VERSION=java-1.8.0

LABEL org.label-schema.description="Sends a message to a topic"
LABEL org.label-schema.name="Awsome Kafka Producer"
LABEL org.label-schema.build_date=${BUILD_DATE}

RUN yum -y update && \
    yum -y install deltarpm && \
    yum install -y ${JAVA_VERSION}-openjdk && \
    rm -rf /var/cache/yum && \
    mkdir -p /opt/awsome

COPY ./src/scripts/run_jar.sh ./target/scala-2.13/awsome-kafka-producer.jar ./src/main/resources/kafka_config.json /opt/awsome/

RUN chmod +x /opt/awsome/run_jar.sh

ENV PATH $JAVA_HOME/bin

ENTRYPOINT ["./run_jar.sh"]
