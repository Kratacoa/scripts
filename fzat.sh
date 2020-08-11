#!/bin/sh
# Fast searching through fzf for documents to input into a PDF editor
# Set the environment variable for $READER if you do not want to use zathura
# Set the environment variable for $DOCUMENTS_DIR if you do not want to use home
# DEPENDENCIES: fzf

reader=${READER:-zathura}
dir=${DOCUMENTS_DIR:-$HOME}
find $dir -type f -regextype egrep -regex '.+pdf|.+djvu|.+epub' -printf "\"%p\"\n" | fzf --multi |  setsid -f xargs -r "$reader" || printf '\e[1;31m%s\e[0m' "Something went wrong!"
