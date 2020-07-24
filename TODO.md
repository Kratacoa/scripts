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

## sshPull
- enter a machine over ssh, open its contents with `$FILE_MANAGER` (or `fzf`) and send back the marked files (directories included) to the chosen directory, on a certain trigger. Iterate till execution of a certain keybind.

## sshCommand
- send a command to execute in the first (or maybe specify it somehow) active X session of a given user

## manageDotfiles
- `fzf` that somehow opens the relevant rc on the left side with the `$EDITOR` and `TODO` on the right
- use [Glow](https://github.com/charmbracelet/glow) for markdown rendering
 
## gitExplorer
- store an index of git repositories on PC and by going over them with `fzf` allow to execute git commands as if inside those directories; could also be done over with `lf` I suppose, somehow
- use [Glow](https://github.com/charmbracelet/glow) for markdown rendering
  
# Improve 

- Explicit the relevant dependencies for each script
 
## lnscript
- Maybe make it into a hook somehow; `man trap`?

## googleDNS
- MAYBE add a hook that send a notification after a certain amount of time that the script has been and `resolv.conf.head` is still alive and well

## fzat
- Introduce an environment variable (e.g. DOCS_DIR) to let `fzat` know where to look, and let it be the home directory by default
- Learn if there is a better to look up for files with certain extensions via fzf
- If executed from the 1st window, make it open the file on the closest available window, scrolling to the right and switch to it
