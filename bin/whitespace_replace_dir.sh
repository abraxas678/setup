#!/bin/bash
x=$(fdfind --type d | awk -F"/" 'NF > max {max = NF} END {print max}')
x=$((x+1))
for i in {0..$x};do
	echo i $i
	sudo find . -maxdepth $i -name "* *" -type d > folderlist
#	cat folderlist
#	echo BUTTON
#	read me
		while read directory; do
		echo
		echo directory $directory
	        echo
		   echo "mv -- $directory ${directory// /-}"
	           sudo mv -- "$directory" "${directory// /-}"
		done < folderlist
done
rm folderlist


