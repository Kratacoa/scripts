#!/bin/bash

# Prepares the files to be managed by GNU Stow, by moving them into the dotfiles directory and symlinking the stuff
# Set the environment variable DOTFILES_DIR or edit the script if $HOME/dotfiles is not your default directory
# DEPENDENCIES: fzf, bash

dotfiles=${DOTFILES_DIR:-$HOME/dotfiles/config/}
tmpfile="$HOME/.cache/storedotf-result"

[[ $# -eq 0 ]] &&
echo "Provide an argument, pretty please" && exit 1

# Create a temporary file where to store the pathnames
touch "$tmpfile"

for argument in "$@"; do

	# Set the variable for resulting directory
	result_dir="$dotfiles/$argument"

	# Searches for the files in $HOME and directories elsewhere
    find "$HOME" \( -type f -path "*/.$argument*" \) -or \( -type d -iname "*$argument*" \) > "$tmpfile"

	if [ -s "$tmpfile" ]; then
    	[ -d "result_dir" ] && mkdir "$result_dir"
        cat "$tmpfile" &&
        printf "\n%s\n" "The directories above are going to be moved inside $dotfiles "

		printf "%b" 'Input (c)hoose if you want to decide which ones to move\nInput (y)es if you want to move them all\nInput anything else to abort (y/c/*) ' && read -n1 reply
        case "$reply" in
            # Horrible hack to input into fzf the paths
        	c) touch $tmpfile-1
        	cat "$tmpfile" | fzf --multi --preview-window=:wrap \
        	--preview='printf "%s\n%s\n%s\n%s" "Press Tab if you want to choose a directory" "Press Return when done" "The full path is:" "{}"' > "$tmpfile"-1
        	mv "$tmpfile"-1 "$tmpfile"
        	;;
    		*) continue
    		;;
        esac
		sed -i "s|$HOME/||g" "$tmpfile"
		# Workaround to read lines from the file (excluding the empty ones)
		grep -v '^ *#' < "$tmpfile" | while IFS= read -r line; do
    		if [ -d "$HOME/$line" ]; then
        		mkdir -p "$result_dir/$line" &&
        		mv "$HOME/$line"/* -t "$result_dir/$line/"
        	elif [ -f "$HOME/$line" ]; then
            	mv "$HOME/$line" -t "$result_dir"
            else
				printf "%s\n" "For some reason the paths chosen cannot be dealt with"
			fi
		done
	else
		printf "%s/n" "No configurations that include the argument have been found."
    fi
done
rm "$tmpfile"
