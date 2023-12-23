#!/bin/fish
# It's pretty much a throwaway script and has various issues, among which the fact that you have to cd into the folder you want to compress
# MUST BE EXECUTED FROM INSIDE THE DIRECTORY CONTAINING THE STUFF TO CONVERT ( sorta)
# Recommended bitrate info here:
# https://wiki.xiph.org/index.php?title=Opus_Recommended_Settings
# https://wiki.hydrogenaud.io/index.php?title=Opus

for directory in (ls -d *);
  if find . $directory -type f -name "*flac" -print -quit > /dev/null 2>&1
    cd $directory
    # TODO: basename on {} doesn't work :((( Don't know how to properly tri mthe file extension
    find . -type f -name "*.flac" -exec \
      ffmpeg -y -i {} -write_id3v1 1 -id3v2_version 3 -c:a libopus -b:a 192K (basename {} .flac).opus \;
    find . -type f -name "*.flac" -exec rm {} \;
    for file in (find . -name "*flac.opus");
      mv $file (basename $file .flac.opus).opus
    end

    cd ..
  else
    echo $directory >> TODO.md
  end
end
