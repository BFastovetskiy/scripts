FROM centos:7.9.2009

RUN yum -y install wget net-tools tar java-1.8.0-openjdk

WORKDIR /opt

VOLUME /opt/sonatype-work

RUN useradd --system --no-create-home nexus && \
    wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz && \
    tar -xvzf latest-unix.tar.gz && \
    mv nexus-* nexus && \
    chown -R nexus:nexus /opt/nexus && \
    chown -R nexus:nexus /opt/sonatype-work && \
    rm -f latest-unix.tar.gz && \
    yum clean all

EXPOSE 8081

USER nexus

CMD /opt/nexus/bin/nexus run
