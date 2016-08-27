# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Veekee

# Mainly based on tvelocity/etherpad-lite
# Parts from http://node-arm.herokuapp.com/

RUN apt-get update && apt-get upgrade && \
    apt-get install -y vim curl unzip wget apache2 && \
    rm -r /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

COPY apache2.conf /etc/apache2

VOLUME /etc/apache2/conf.d

VOLUME /var/log/apache2

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bin/run.sh", "--root"]
