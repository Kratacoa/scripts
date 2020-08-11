# Make

## setup
- setup the dotfiles and stuff for reproducible systems

## backup
- backup important data; perhaps make some of it torrent-available too or something like that

## indexTODO
- hook that makes and updates a directory with symbolic links and appropriate names in `~/notes` based on the `TODO.md` file

## reminderStudyDiary
- hook that reminds you on certain intervals (e.g. 1 day, 7 days, 1 month, 6 months, 1 year) of what you studied before based on the syntax of diary entries
- this can be executed in a few ways:
	- adding tasks with taskwarrior and sending notifications with that
	- adding it to calcurse and use its entries to send notifications
	- make a text file as a database in `~/.local/share` and use it for the reminders

## sshPull
- enter a machine over ssh, open its contents with `$FILE_MANAGER` (or `fzf`) and send back the marked files (directories included) to the chosen directory, on a certain trigger. Iterate till execution of a certain keybind.

## sendCommand
- send a command to execute in the first (or maybe specify it somehow) active X session of a given user
 
## gitExplorer
- store an index of git repositories on PC and by going over them with `fzf` allow to execute git commands as if inside those directories; could also be done over with `lf` I suppose, somehow
- use [Glow](https://github.com/charmbracelet/glow) for markdown rendering

## xbpsUpdate
- check if there are any updates to the packages

# Improve 

- Explicit the relevant dependencies for each script
 
## lnscript
- Maybe make it into a hook somehow; `man trap`?
- Not sure if it is appropriate to automatically give scripts writing permissions, whatev

## googleDNS
- add a hook that send a notification after a certain amount of time that the script has been and `resolv.conf.head` is still alive and well

## fzat
- Add support for multiple directories?

## fdot
- Find out if a preview can be added comfortably via fzf for some pager
- check out how [dotbare](https://github.com/kazhala/dotbare)

# storedotf
- Find a universal way to change `fzf` with an editor
