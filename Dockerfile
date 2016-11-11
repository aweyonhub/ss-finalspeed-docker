FROM ubuntu:trusty

MAINTAINER chenug <jonechenug@gmail.com>

RUN apt-get update && \
    apt-get install -y --force-yes -m python-pip python-m2crypto && \
    apt-get install -y --force-yes curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install shadowsocks

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh


RUN curl -sSL https://raw.githubusercontent.com/jonechenug/finalspeed/master/install_fs.sh --output install_fs.sh \
&& chmod +x install_fs.sh \
&& ./install_fs.sh 2>&1 | tee install.log 


EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
