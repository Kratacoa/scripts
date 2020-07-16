# Make

## setup
- setup the dotfiles and stuff for reproducible systems

## backup
- backup important data; perhaps make some of it torrent-available too or something like that

## markdown2org
- script/hook for Emacs that converts markdown into org syntax when opening a .md file, and turns back into markdown when saving

## indexTODO
- hook that makes and updates a directory with symbolic links and appropriate names in `~/notes` based on the `TODO.md` file

## reminderStudyDiary
- hook that reminds you on certain intervals (e.g. 1 day, 7 days, 1 month, 6 months, 1 year) of what you studied before based on the syntax of diary entries
- this can be executed in a few ways:
	- adding tasks with taskwarrior and sending notifications with that
	- adding it to calcurse and use its entries to send notifications
	- make a text file as a database in `~/.local/share` and use it for the reminders

## manageDotfiles
- fzf that somehow opens the relevant rc on the left side with the `$EDITOR` and `TODO` on the right
 
# Improve 

- Explicit the relevant dependencies for each script
 
## lnscript
- Make it into a hook somehow; `man trap`?

## googleDNS
- Add a hook that activates the "off" part of the script after a certain period of inactivity

## fzat
- Introduce an environment variable (e.g. DOCS_DIR) to let `fzat` know where to look, and let it be the home directory by default
- Learn if there is a better to look up for files with certain extensions via fzf

