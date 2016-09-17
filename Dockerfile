# Pull base image
FROM resin/rpi-raspbian:jessie
MAINTAINER Veekee

ENV LANG C.UTF-8
ENV TZ Europe/Paris

# Mainly based on nimmis/docker-apache

RUN apt-get -qq update
RUN apt-get upgrade
RUN apt-get install -y --no-install-recommends apt-utils vim curl unzip wget apache2
RUN rm -r /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

#COPY apache2.conf /etc/apache2

VOLUME /etc/apache2/conf-enabled

VOLUME /etc/apache2/sites-enabled

VOLUME /etc/ssl/certs

VOLUME /var/www

VOLUME /var/log/apache2

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
