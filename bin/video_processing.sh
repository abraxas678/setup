#!/bin/bash
echo $PWD
echo
echo FOLDER WHITESPACE REMOVAL
settitle FOLDER WHITESPACE REMOVAL
echo
source whitespace_replace_dir.sh
echo
ECHO FILE WHITESPACE REMOVAL
echo
source whitespace_replace_file.sh
echo
#echo MOVE FILES
#echo
#source file_processing.sh
echo MOVE TO MY LEVEL
echo
source  move_files_to_my_level.sh      
echo
cd a_moved
ehco
echo $PWD
echo
echo CNFO.SH
echo
source cnfo.sh
echo
