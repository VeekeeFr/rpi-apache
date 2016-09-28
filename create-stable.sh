#!/bin/bash

docker run -d --name apache-stable -v /etc/apache2/sites-enabled:/etc/apache2/sites-enabled -v /var/log/apache2:/var/log/apache2 -p 80:80 veekee/rpi-apache:latest
