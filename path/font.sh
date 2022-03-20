#!/bin/bash
###   ändere die kodi font.xml
ts=$(ts.sh)
while read line; do
  if [[ $line = *"<size>"* ]];then
     mynumber=$(echo $line | sed 's/<size>//' | sed 's/<\/size>//')
     num2=$((mynumber+15))
     echo MYNUMBER $mynumber
     echo NUM2 $num2
     line="<size>$num2</size>"
  fi
  echo $line >> Font$ts.xml
done <Font.xml
