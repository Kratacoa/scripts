#!/bin/sh
# Fast searching through fzf for documents to input into a PDF editor

# Set the environment variable for $READER if you do not want to use zathura
reader=${READER:-zathura}

tree -fiQ $HOME | fzf --multi --query=' .pdf | .djvu | .epub ' | setsid -f xargs "$reader" || echo "Something went wrong"
