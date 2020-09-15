#!/bin/bash
# Compress PDF via some PostScript trickery
# No clue how it works, retrieved it from here: https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file
# There is also [shrinkpdf](http://www.alfredklomp.com/programming/shrinkpdf/), but I have no clue whether it's an improvement or not
# IMPORTANT: may not reduce the filesize at all, but actually increase it; always check the end result
# DEPENDENCIES: ghostscript suite

file_without_ext="$(basename -s .pdf "$1")"
if file --mime-type "$1" | grep -iq pdf; then
    pdf2ps "$1" "$file_without_ext".ps && \
    ps2pdf "$file_without_ext".ps "$file_without_ext"-compressed.pdf
    rm "$file_without_ext".ps
else
	printf "%s\n" "Only PDF files are supported at this time."
fi
