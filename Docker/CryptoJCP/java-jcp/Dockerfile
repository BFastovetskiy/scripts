FROM centos:7.6.1810

RUN yum update -y && \
    yum install -y net-tools wget curl nano unzip tar java-1.8.0-openjdk-accessibility java-1.8.0-openjdk-headless java-1.8.0-open
    yum clean all

WORKDIR /opt

COPY jcp-2.0.40035.zip ./jcp-2.0.40035.zip
COPY *.jar /opt/

ARG JCP_SERIAL=0000-00000-00000-00000-00000

ENV JCP_SERIAL=$JCP_SERIAL
ENV JAVA_HOME=/usr/lib/jvm/jre

RUN unzip jcp-2.0.40035.zip && \
    chmod a+x ./jcp-2.0.40035/*.sh && \
    cd jcp-2.0.40035 && \
    ./setup_console.sh $JAVA_HOME -force -ru -install -jcp -serial_jcp $JCP_SERIAL && \

    cd /opt && \
    cp -f commons-logging-1.2.jar /usr/lib/jvm/jre/lib/ext/commons-logging-1.2.jar && \
    cp -f xmlsec-1.5.8.jar /usr/lib/jvm/jre/lib/ext/xmlsec-1.5.8.jar && \
    cp -f XMLDSigRI.jar /usr/lib/jvm/jre/lib/ext/XMLDSigRI.jar && \

    mkdir /opt/app && \
    mkdir /opt/keys
