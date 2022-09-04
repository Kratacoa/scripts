#!/bin/bash
# Stow all the files in the chosen directory, targetting the $HOME directory
# DEPENDENCIES: stow (duh)

dotfiles_dir=${1:-"$HOME/dotfiles/config"}
current_dir=$(pwd)
list=$(find "$dotfiles_dir" -maxdepth 1 ! -path . -type d | sed '1d')

if cd "$dotfiles_dir"; then
    for i in $list; do
        dir=$(basename "$i")
        printf "\n%s" "If you want to stow $dir, press (y)es, otherwise something else "
        reply=$(read -n 1)

        if [ "$reply" = "y" -o "$reply" = "Y" ]; then
            stow --verbose --target="$HOME" -S "$dir"
        fi
    done
else
	printf "%s\n" "Can't access the dotfiles directory"
fi
cd "$current_dir" ||
printf "%s\n" "Couldn't return back to the current directory" && exit 1
