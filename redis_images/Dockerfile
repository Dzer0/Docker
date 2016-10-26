FROM centos:latest
MAINTAINER Dzer0
COPY redis /usr/local/redis
COPY run.sh /run.sh
RUN chmod u+x run.sh
WORKDIR /usr/local/redis
ENTRYPOINT ["/run.sh"]
