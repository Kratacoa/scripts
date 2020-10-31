#!/bin/sh
# Takes a screenshot of the current board

[ -d pictures/screenshots ] || mkdir -p pictures/screenshots

maim | tee "$HOME"/pictures/screenshots/"$(date +%4Y-%m-%d_%H-%M)".png | xclip -selection clipboard -t image/png
