# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Veekee

# Mainly based on nimmis/docker-apache

RUN apt-get update && apt-get upgrade && \
    apt-get install -y vim curl unzip wget apache2 && \
    rm -r /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

COPY apache2.conf /etc/apache2

VOLUME /etc/apache2/conf.d

VOLUME /var/log/apache2

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
