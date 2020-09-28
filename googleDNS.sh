#!/bin/bash

# Add Google DNS nameservers as main ones to access otherwise unavailable stuff

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [[ ! -f /etc/resolv.conf.head ]]
then
    echo "Appending Google nameservers to /etc/resolv.conf.head"
	# IPv4
	echo "nameserver 8.8.8.8" >> /etc/resolv.conf.head
	echo "nameserver 8.8.4.4" >> /etc/resolv.conf.head
	# IPv6
	echo "nameserver 2001:4860:4860::8888" >> /etc/resolv.conf.head
	echo "nameserver 2001:4860:4860::8844" >> /etc/resolv.conf.head
	sv reload wpa_supplicant 1> /dev/null # not sure if reloading dhcpcd is necessary
else
	echo -e "The output of /etc/resolv.conf.head is \n"
	cat /etc/resolv.conf.head && echo ""
	read -n 1 -p "/etc/resolv.conf.head is going to be removed; if you want to proceed, type (y)es " reply && echo ""
 	if [ $reply = "y" ] || [ $reply = "Y" ]; then
     	rm /etc/resolv.conf.head &&
     	sv reload wpa_supplicant 1> /dev/null &&
     	sv reload dhcpcd 1> /dev/null &&
     	exit 0
    fi
	echo "The reply is not (y)es, or something else went wrong" && exit 1
fi
