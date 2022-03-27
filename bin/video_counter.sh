#!/bin/bash
echo
#fdfind -e mp4 -e nfo > filelist
echo "mp4:"
fdfind -e mp4 | wc -l
echo
echo "nfo:"
fdfind -e nfo | wc -l
echo "fanart:"
fdfind "*fanart*" | wc -l
echo "poster:"
fdfind "*poster*" | wc -l
say.sh video counter finished &>/dev/null
send.sh video counter finished &>/dev/null
