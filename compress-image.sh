#!/bin/sh
# Compress jpg images according to Google's recommended standards on https://developers.google.com/speed/docs/insights/OptimizeImages
# Dependencies: imagemagick

for i in "$@"; do
    if file --mime-type "$i" | grep -iq jpeg; then
        convert "$i" -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB "$(basename "$i")"_compressed.jpg
   	elif file --mime-type "$i" | grep -iq png; then
       	convert "$i" -strip "$(basename "$i")"_compressed.png
    else
		printf "%s\n" "Script supports only .jpg and .png files at this point, sorry mate!"
	fi
done
