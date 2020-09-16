#!/bin/bash
# Stow all the files in the chosen directory, targetting the $HOME directory
# DEPENDENCIES: stow (duh)

dotfiles_dir=${1:-"$HOME/dotfiles/config"}
current_dir=$(pwd)
list=$(find "$dotfiles_dir" -maxdepth 1 ! -path . -type d | sed '1d')

if cd "$dotfiles_dir"; then
    for i in $list; do
        dir=$(basename "$i")
        stow --verbose --target="$HOME" -S "$dir"
    done
else
	printf "%s\n" "Can't access the dotfiles directory"
fi
cd "$current_dir" ||
printf "%s\n" "Couldn't return back to the current directory" && exit 1
