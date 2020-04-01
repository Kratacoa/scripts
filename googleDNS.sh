#!/bin/bash

# Add Google DNS nameservers as main ones to access otherwise unavailable stuff
# If `setup` script is run, it requires sudo (as it should)

read -p "Do you want to add Google DNS or remove it? (on/off) " reply

if [[ $reply = on ]]
then
	# IPv4
	echo "nameserver 8.8.8.8" >> /etc/resolv.conf.head
	echo -e "nameserver 8.8.4.4\n" >> /etc/resolv.conf.head
	# IPv6
	echo "nameserver 2001:4860:4860::8888" >> /etc/resolv.conf.head
	echo "nameserver 2001:4860:4860::8844" >> /etc/resolv.conf.head

	sv reload wpa_supplicant # not sure if reloading dhcpcd is necessary
elif [[ $reply = off ]]
then
	rm /etc/resolv.conf.head
	sv reload wpa_supplicant && sv reload dhcpcd
else
	echo "Wrong input"
fi
