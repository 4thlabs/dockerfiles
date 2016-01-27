FROM 4thlabs/java:jre-8
MAINTAINER 4thlabs <4thlabs@gmail.com>

RUN apt-get update && \
	apt-get install -y supervisor && \
	mkdir /downloads && \
	mkdir /logs

WORKDIR /

RUN wget --progress=dot:mega http://installer.jdownloader.org/JDownloader.jar && \
	java -Djava.awt.headless=true -jar /JDownloader.jar -norestart

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/cfg", "/downloads", "/logs"]

EXPOSE 3129
EXPOSE 10101

#CMD ["java","-Djava.awt.headless=true", "-jar", "/JDownloader.jar", "-f", "-n"]
CMD ["supervisord", "-n"]
