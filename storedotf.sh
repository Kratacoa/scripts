#!/bin/bash

# Prepares the files to be managed by GNU Stow, by moving them into the dotfiles directory and symlinking the stuff
# Set the environment variable DOTFILES_DIR or edit the script if $HOME/dotfiles is not your default directory
# DEPENDENCIES: fzf, bash

dotfiles=${DOTFILES_DIR:-$HOME/dotfiles/}
tmpfile="$HOME/.cache/storedotf-result"

[[ $# -eq 0 ]] && echo "Provide an argument, pretty please" && exit 1
touch $tmpfile
for argument in "$@"; do
    find $HOME \( -type f -path "*/.$argument*" \) -or \( -type d -iname "*$argument*" \) > $tmpfile
    cat $tmpfile && printf "\n%s\n" "The directories above are going to be moved inside $dotfiles ."
    read -n1 -p 'Input "no" if you want to choose which ones to move, "yes" if you want to move them all (y/n)' reply
    case "$reply" in
    	y)	mv $(cat "$tmpfile" | tr '\n' ' ') -t $dotfiles
    	;;
    	*)	cat "$tmpfile" | fzf --multi --preview-window=:wrap --preview='echo -e "Press Tab if you want to choose a directory\nPress Return when done" && echo -e "\nThe full path is:\n{}"'| xargs -r mv -t $dotfiles
    	;;
	esac
done
rm "$tmpfile"
