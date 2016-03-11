FROM ubuntu:14.04

MAINTAINER jonechenug <jonechenug@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y --force-yes -m python-pip python-m2crypto

RUN apt-get install -y --force-yes supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get -y install iptables
RUN apt-get install -y openjdk-7-jre

RUN mkdir -p /fs
COPY fs.jar /fs/fs.jar
COPY fs_start.sh /fs/fs_start.sh
RUN chmod -R 755 /fs

RUN pip install shadowsocks

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
 
ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["/usr/bin/supervisord"]
