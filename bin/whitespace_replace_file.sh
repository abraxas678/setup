i=1
while [ "$i" -le "10" ]; do

  find . -type f -name "* *" | while read file; do 
   # if [ "$file" != *"part"* ] && [ "$file" != *"tmp"* ] && [ "$file" != *"temp"* ]; then
      echo "$file"; 
      sudo mv "$file" ${file// /_}; 
   # else 
    #  mv $file /mnt/nfs/jdownloader/output/part 
   #fi
 done
#  find . -type f -name "*part" | while read file; do
#    mv $file /mnt/nfs/jdownloader/outputpart 
#  done
 i=$((i+1))
  echo $i
done
rclone rmdirs .
