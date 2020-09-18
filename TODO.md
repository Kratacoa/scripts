# Make

## backup
- backup important data; perhaps make some of it torrent-available too or something like that

## clean
- some sort of periodic cleaner of useless files that I either don't care to find the cause of, or are remainders of some operations

## compile
- versatile compile script
	» [Lukesmith version](https://github.com/LukeSmithxyz/voidrice/blob/ae9c12a861d07b792ebe24b85bda1567cc5c37ab/.local/bin/compiler)
	## indexTODO
- hook that makes and updates a directory with symbolic links and appropriate names in `~/notes` based on the `TODO.md` file

## fzf-grep
- Search in a given directory for a regexp, and then send the output files to `fzf`. Preview the lines found in the given file in `fzf`. Open the file with an editor

## gitExplorer
- store an index of git repositories on PC and by going over them with `fzf` allow to execute git commands as if inside those directories; could also be done over with `lf` I suppose, somehow
- use [Glow](https://github.com/charmbracelet/glow) for markdown rendering

## imageEdit
- Interactive script for displaying the result of `imagemagick` arguments, output into an image viewer (such as `sxiv`)

## manQuery
- Open a manpage for the program in the current window

## pdfGrep
- Check for certain strings or regular expressions inside formats like pdf, djvu and epub; may exist already, otherwise it may be doable with standard `grep` and `pdftotext` (or other such tools), but not sure how fast that would be

## rymSuggestion
- send a query for a random album based on genre in the top 50/100/250/500

## screencast
- ffmpeg based

## sendCommand
- send a command to execute in the first (or maybe specify it somehow) active X session of a given user

## setup
- setup the dotfiles and stuff for reproducible systems
	» one separate script for choosing and installing the packages
	» another for downloading relevant dotfiles, either wit `git` or with `curl`, depending on the option chosen by the user

## sshPull
- enter a machine over ssh, open its contents with `$FILE_MANAGER` (or `fzf`) and send back the marked files (directories included) to the chosen directory, on a certain trigger. Iterate till execution of a certain keybind.

## telegramBackup
- download all files/medias/audio/etc. from a given chat; check if it's already somewhere

## timer
- figure out how to send a notification once a certain amount of time has passed, or a certain time is reached; I think they're analoguous, but I'm not sure

## update-readme
- sed out the comments from the scripts and add them to the README, formatted accordingly

## xbpsUpdate
- check if there are any updates to the packages
- insert a check for new linux release (since it doesn't upgrade by default to the next release)

# Improve 

- Explicit the relevant dependencies for each script
 
## backup_encrypt_dir.sh
- Remove old backups on the receiving end as well
- Add `-i` option for input and `-o` option for output

## fzat
- Show only the filenames and parent directory instead of full path
- Checks for poorly formatted filenames
- Add an option (`-d` ?) to set the directory
- Add support for chosen directories?
- Add support for xdg-open

## fdot
- Add an option (`-d` ?) to set the directory
- Add a binding to create a file in the chosen directory
- Add a binding to `cd` into the directory of the currently selected path
- Find out if a preview can be added comfortably via fzf for some pager
- Add support for xdg-open
- Add restricted selections (for scripts, used configs, backup configs)
- Remove `.backup` from selections
- Generalise it?
- check out how [dotbare](https://github.com/kazhala/dotbare) works

## googleDNS
- add a hook that send a notification after a certain amount of time that the script has been and `resolv.conf.head` is still alive and well

## lnscript
- Maybe make it into a hook somehow; `man trap`?
- Not sure if it is appropriate to automatically give scripts writing permissions, whatev

# storedotf
- Use bash facilities for temporary files
- Add an option (`-d` ?) to set the directory
- Find a universal way to change `fzf` with an editor

# sync_dir
- Add `-o` option for output directories, `-i` for input dir
- Make it rely on a list database
- Setup the fucking SSH to bypass those checks; not comfy
