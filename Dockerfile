#Subsonic Standalone Docker Image v6.1.6 with support for ARM ARM64 and AMD64
FROM ubuntu:20.04
MAINTAINER Hydria ivan@imina.eu

ENV LANG en_US.UTF-8 ENV LC_ALL en_US.UTF-8

RUN echo "Subsonic StandAlone Docker Image With FFMPEG (v6.0)"
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install locales ffmpeg openjdk-8-jre-headless nano flac lame wget  -y
RUN mkdir -p /opt/subsonic && rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN wget --no-check-certificate https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-6.1.6-standalone.tar.gz && tar xvzf subsonic-6.1.6-standalone.tar.gz -C /opt/subsonic && rm -rf subsonic-6.1.6-standalone.tar.gz
RUN mkdir -p /var/subsonic/transcode && ln -s /usr/bin/ffmpeg /var/subsonic/transcode && apt-get clean

VOLUME ["/var/music", "/var/subsonic"]
EXPOSE 4040
CMD /bin/bash -c "export LANG=en_US.UTF-8 && /opt/subsonic/subsonic.sh && /bin/bash"
