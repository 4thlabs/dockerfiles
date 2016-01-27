FROM 4thlabs/java:jre-8
MAINTAINER 4thlabs <4thlabs@gmail.com>

RUN apt-get update && \
	apt-get install -qqy inotify-tools wget && \
	wget --progress=dot:mega http://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.6.1/filebot_4.6.1_amd64.deb && \
	dpkg -i filebot_4.6.1_amd64.deb

COPY watch.sh /
RUN chmod +x /watch.sh

VOLUME ["/watch", "/data"]

CMD ["/watch.sh"]
