#!/bin/bash
echo
#fdfind -e mp4 -e nfo > filelist
echo "mp4:"
fdfind -e mp4 | wc -l
echo
echo "nfo:"
fdfind -e nfo | wc -l
