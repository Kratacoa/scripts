#!/bin/bash

dotfiles_dir=${$1:-"$HOME/dotfiles/config"}
current_dir=$(pwd)

list=$(find "$dotfiles_dir" -maxdepth 1 ! -path . -type d)
cd $dotfiles_dir
for i in $list; do
    dir=$(basename $i)
    stow -t "$HOME" -S "$dir"
done
cd "$current_dir"
