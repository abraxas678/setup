i=1
while [ $i -le 10 ]; do
  find . -type f -name "* *" | while read file; do 
# if [ $file != *"part"* ] && [ $file != *"tmp"* ] && [ $file != *"temp"* ]; then
      echo $file; 
      mv "$file" "${file//\'/_}"; 
# fi
  done
  i=$((i+1))
  echo $i
done
