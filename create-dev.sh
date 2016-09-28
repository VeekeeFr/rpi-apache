#!/bin/bash

docker run -d --name apache-dev -v /etc/apache2/sites-enabled:/etc/apache2/sites-enabled -v /var/log/apache2:/var/log/apache2 -p 8080:80 veekee/rpi-apache:dev
