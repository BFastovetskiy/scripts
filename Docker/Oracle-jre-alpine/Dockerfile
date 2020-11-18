FROM alpine:3.10
WORKDIR /opt
ENV GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc \
    GLIBC_VERSION=2.29-r0 \
    LANG=C.UTF-8 \
    JAVA_HOME=/usr/java/default

RUN apk -U upgrade && \
    apk add tar libstdc++ curl ca-certificates bash java-cacerts && \
    for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION} glibc-i18n-${GLIBC_VERSION}; do curl -sSL ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -o /tmp/${pkg}.apk; done && \
    apk add --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    ( /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true ) && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib

RUN wget https://github.com/frekele/oracle-java/releases/download/8u212-b10/jre-8u212-linux-x64.tar.gz && \
    tar xvzf /opt/jre-8u212-linux-x64.tar.gz && \
    mkdir -p /usr/java && \
    mv /opt/jre1.8.0_212 /usr/java/jre1.8.0_212 && \
    ln -s /usr/java/jre1.8.0_212 /usr/java/default && \
    ln -s /usr/java/jre1.8.0_212 /usr/java/latest && \
    ln -sf /etc/ssl/certs/java/cacerts $JAVA_HOME/lib/security/cacerts && \
    rm -f /opt/jre-8u212-linux-x64.tar.gz && \
    apk del tar curl glibc-i18n

ENV PATH="${JAVA_HOME}/bin:${PATH}"


CMD /bin/bash
