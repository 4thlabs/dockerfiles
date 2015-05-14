FROM debian:jessie
MAINTAINER 4thlabs <4thlabs@gmail.com>

ENV JAVA_VERSION=8u45
ENV JAVA_HOME=/usr/lib/jvm/jdk1.8.0_45

# Installing requirements
RUN \
    apt-get update && apt-get install -y wget && \
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz && \
    mkdir --parents /usr/lib/jvm && \
    tar -xvf jdk-8u45-linux-x64.tar.gz -C /usr/lib/jvm && \
    rm -f jdk-8u45-linux-x64.tar.gz && \
    rm -rf /var/lib/apt/lists/*

RUN \
    update-alternatives --install /usr/bin/java java ${JAVA_HOME}/bin/java 1065 && \
    update-alternatives --install /usr/bin/javac javac ${JAVA_HOME}/bin/javac 1065

ENV PATH ${JAVA_HOME}/bin:$PATH

CMD ["bash"]