#!/bin/bash

directory=
backup_destination=
backup_source="$HOME"/"$directory"
filename="$directory"_"$(date +%Y_%m_%d)"
current_directory="$(pwd)"
old_backup=$(grep -i "$(basename "$filename")" "$backup_destination"/*)
# In case you want to also sync it with another device via rsync
# receiver=

test -z "$backup_source" &&
printf "%s" "You gotta tell me what's the directory to backup, come on" &&
exit 1

test -z "$backup_destination" &&
printf "%s" "You gotta tell me what's the backup directory, come on." &&
exit 1

cd "$backup_destination" || exit 1
tar czvf "$backup_destination"/"$filename".tar.gz -C "$backup_source" .
printf "\n\033[1m%s\033[0m\n" "Insert password for the backup archive on the following line." &&
gpg --symmetric "$backup_destination"/"$filename".tar.gz
printf "\033[1m%s\033[0m\n" "Insert password for the receiver SSH server on the following line." &&
# rsync --rsh=ssh --info=progress2 "$filename".tar.gz.gpg "$receiver":"$backup_destination"

for file in $old_backup; do
    rm "$file";
done
rm "$filename".tar.gz
cd "$current_directory" || exit 1
