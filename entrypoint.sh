#!/bin/bash

if [ ! -z "$ENABLE_SSL" ]; then
	echo 'Enabling SSL support'
	/usr/sbin/a2ensite default-ssl
	/usr/sbin/a2enmod ssl
fi

echo "###########################################"
date
echo "###########################################"

echo "Copying apache modules"
cp /etc/apache2/mods-available/proxy* /etc/apache2/mods-enabled
cp /etc/apache2/mods-available/vhost_alias.load /etc/apache2/mods-enabled
cp /etc/apache2/mods-available/request.load /etc/apache2/mods-enabled
cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled
cp /etc/apache2/mods-available/xml2enc.load /etc/apache2/mods-enabled
cp /etc/apache2/mods-available/slotmem_shm.load /etc/apache2/mods-enabled

echo "Checking configuration"
apache2ctl -t

echo "Starting httpd deamon"
service apache2 start

while true
do
	sleep 30
done
