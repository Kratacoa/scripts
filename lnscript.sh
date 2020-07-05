#!/bin/bash

# Make scripts executable and link them to /usr/local/bin directory so that they are available to the PATH

for script in "$@"
do
	if [[ -f $script ]] && [[ ! -e /usr/local/bin/$(basename -s .sh $script) ]]; then
		read -p "Do you want to link the $script to /usr/local/bin/ ? (yes/no) " reply
		[[ $reply =~ ^y ]] && chmod +x $script && ln -s $(readlink -f $script) /usr/local/bin/$(basename -s .sh $script)
	else
		echo "$script is either not a regular file or is already present in /usr/local/bin"
	fi
done
