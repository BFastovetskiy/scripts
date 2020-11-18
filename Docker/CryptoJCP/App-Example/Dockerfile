FROM docker-service.cluster.local/maven:3.6.1-alpine as builder
WORKDIR /app
COPY . ./
RUN mvn clean package -P prod -DskipTests

FROM docker-service.cluster.local/java-jcp:v.1.1

ARG PORT=8080
ARG ALIAS
ARG PASSWORD
ARG JAVA_PARAM="-XX:+UseG1GC -XX:+DisableExplicitGC -Xms512m -Xmx1g -XX:MaxDirectMemorySize=1g"

ENV PORT $PORT
ENV ALIAS $ALIAS
ENV PASSWORD $PASSWORD
ENV JAVA_PARAM $JAVA_PARAM

RUN rm -rf /opt/*

WORKDIR /opt

VOLUME /opt/keys

COPY --from=builder /app/target/app-*.war /opt/app/app.war
COPY --from=builder /app/startup.sh /opt/app/startup.sh

RUN chmod a+x /opt/app/startup.sh

EXPOSE $PORT

CMD ["app/startup.sh"]
