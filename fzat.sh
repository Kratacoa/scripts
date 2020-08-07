#!/bin/bash
# Fast searching through `fzf` for documents to input into `zathura`

tree -fiQ $HOME | fzf --multi --query=' .pdf | .djvu | .epub ' | xargs zathura || echo "Something went wrong"
