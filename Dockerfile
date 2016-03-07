FROM ubuntu:trusty

MAINTAINER jonechenug <jonechenug@gmail.com>

COPY install_fs.sh /usr/local/etc/install_fs.sh

COPY shadowsocks.sh /usr/local/etc/shadowsocks.sh


EXPOSE 8989

CMD /usr/local/etc/shadowsocks.sh 2>&1 | tee shadowsocks.log && /usr/local/etc/install_fs.sh 2>&1 | tee install.log
