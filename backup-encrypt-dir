#!/bin/bash

filename="notes_$(date +%Y_%m_%d)"
current_directory="$(pwd)"
backup_directory=
old_backup=$(grep -i "$(basename "$filename")" "$backup_directory"/*)
receiver='splop@192.168.1.178'

cd ${backup_directory:-"$HOME/backup"} || exit 1
tar czvf "$HOME"/backup/"$filename" -C "$HOME/notes" .
gpg --symmetric"$HOME"/backup/"$filename".tar.gz
rsync --rsh=ssh --info=progress2  "$filename".tar.gz.gpg "$receiver":~/backup/
for file in $old_backup; do
    rm "$file";
done
rm "$filename".tar.gz
cd "$current_directory" || exit 1
