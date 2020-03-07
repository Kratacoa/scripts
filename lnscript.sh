#!/bin/bash

# Make scripts executable and link them to /usr/local/bin directory so that they are available to the shell

for script in "$@"
do
	if [[ ! -e /usr/local/bin/$(basename -s .sh $script) ]]
	then
		if [[ $(read -p "Do you want to link the $script to /usr/local/bin/ ? (yes/no) ") =~ ^y ]]
		then
			chmod +x $script
			ln -s $script /usr/local/bin/$(basename -s .sh $script)
		fi
	fi
done
