FROM 4thlabs/java:jdk-8
MAINTAINER 4thlabs <4thlabs@gmail.com>

RUN \
    apt-get update && apt-get install -qqy curl && \
    curl -L -o go-server.deb http://download.go.cd/gocd-deb/go-server-15.1.0-1863.deb && \
    dpkg -i --force-all go-server.deb && \
    rm go-server.deb

VOLUME /etc/go
VOLUME /data/artifacts
VOLUME /var/go

EXPOSE 8153
EXPOSE 8154

COPY go-cd.sh /

RUN chmod +x /go-cd.sh

CMD ["/go-cd.sh"]	
