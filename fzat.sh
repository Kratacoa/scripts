#!/bin/bash

# Fast searching through `fzf` for documents to input into `zathura`

CWD=$(pwd)
cd /home/splop/
DOC=$(fzf) 
if [[ -e "$DOC" ]]; then
	zathura "$DOC" &
else 
	echo "fzf didn't work I guess"
fi
cd $CWD
