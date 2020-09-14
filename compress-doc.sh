#!/bin/bash
# Compress PDF via some PostScript trickery
# No clue how it works, retrieved it from here: https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file
# There is also [shrinkpdf](http://www.alfredklomp.com/programming/shrinkpdf/), but I have no clue whether it's an improvement or not
# Dependencies: ghostscript suite

if file --mime-type "$1" | grep -iq pdf; then
    pdf2ps "$1" "$(basename "$1")".ps && ps2pdf "$(basename "$1")".ps "$(basename "$1")".pdf
else
	printf "%s\n" "Only PDF files are supported at this time."
fi
