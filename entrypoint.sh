#!/bin/sh

if [ -z "$ENABLE_SSL" ]; then
	echo 'Enabling SSL support'
	/usr/sbin/a2ensite default-ssl
	/usr/sbin/a2enmod ssl
fi
