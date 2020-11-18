FROM java:8-jre

ARG JAVA_CONF="-Xms256M -Xmx1024M -XX:+UseG1GC"
ENV JAVA_CONF=$JAVA_CONF

RUN mkdir -p /opt/app
VOLUME /opt/app
WORKDIR /opt/app

ENV PATH=$PATH:/opt/app

CMD java $JAVA_CONF -jar $JAVA_APP $JAVA_PARAMS
