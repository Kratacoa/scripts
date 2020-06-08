#!/bin/bash

# Prepares the files to be managed by GNU Stow, by moving them into the dotfiles directory and symlinking the stuff
# It supports multiple arguments
# Change the dotfiles directory to your liking

DOTFILES=$HOME/.dotfiles/

if [[ $# -eq 0 ]]
then
	echo "Provide an argument, pretty please"
	exit 1
fi

cd $DOTFILES

for arg in "$@"
do 
	mkdir $DOTFILES/$arg

	if [[ $(ls -A $HOME | grep -i $arg | wc -w) -ge 1 ]]
	then
		read -p "I'm about to move every file in the home directory that has $arg in its name into the dotfile directory. Is this okay with you? (yes/no) " bool
		if [[ $bool =~ ^y ]]
		then 																				# There is probably a way to do this that doesn't look like a hack
			cd $HOME
			mv -v $(ls -A $HOME | grep -i $arg ) -t $DOTFILES/$arg
			cd $DOTFILES
		fi

	elif [[ -e $HOME/.config/$arg ]];
	then 
		mkdir $arg/.config
		mv -v "$HOME/.config/$arg"  "$arg/.config/"
	fi

	stow "$arg"
done
