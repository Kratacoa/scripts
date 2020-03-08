#!/bin/bash

# Make scripts executable and link them to /usr/local/bin directory so that they are available to the shell



for script in "$@"
do
	if [[ -d $script ]]
	then
		continue

	elif [[ ! -e /usr/local/bin/$(basename -s .sh $script) ]]
	then
		read -p "Do you want to link the $script to /usr/local/bin/ ? (yes/no) " reply
		if [[ $reply =~ ^y ]]
		then
			chmod +x $script
			ln -s $(readlink -f $script) /usr/local/bin/$(basename -s .sh $script) 
		fi
	fi
done
