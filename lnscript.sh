#!/bin/bash

# Make scripts executable and link them to $HOME/.local/bin directory so that they are available to the PATH

for script in "$@"
do
	if [[ -f $script ]] && [[ ! -e $HOME/.local/bin/$(basename -s .sh $script) ]]; then
		read -p "Do you want to link the $script to $HOME/.local/bin/ ? (yes/no) " reply
		[[ $reply =~ ^y ]] && chmod +wx $script && ln -sf $(readlink -f $script) $HOME/.local/bin/$(basename -s .sh $script)
	else
		echo "$script is either not a regular file or is already present in $HOME/.local/bin"
	fi
done
