#!/bin/sh
# Opens regular files in the dotfiles directory with your favourite editor
# Set the environment variables or change the values below to fit your usage
# DEPENDENCIES: fzf

dotfiles=${DOTFILES:-$HOME/dotfiles}
editor=${EDITOR:-kak}
find "$dotfiles" -name .git -prune -o -type f -print | fzf --bind "enter:execute%echo {} | xargs -o $editor%"
