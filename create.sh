#!/bin/bash

docker run -d --name apache-dev -v /etc/apache2/conf.d:/etc/apache2/conf.d -v /var/log/apache2:/var/log/apache2 -p 80:80 veekee/rpi-apache:dev
