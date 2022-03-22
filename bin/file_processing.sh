rm -f filelist
echo $PWD 4weeks
echo
fdfind --changed-within 4weeks '.*.mp4$' $PWD -x echo {.}'*' >> filelist
echo
echo "FILES FOUND:"
echo
cat filelist
source line
echo
while read file; do
  ls $file
  mv $file /volume2/push/MAIN/4weeks
  echo
done < filelist
rm -f filelist


##################################################################################


rm -f filelist
echo  /volume2/push/MAIN/4weeks 2 weeks
echo
fdfind --changed-within 2weeks '.*.mp4$' /volume2/push/MAIN/4weeks -x echo {.}'*' >> filelist
echo
echo "FILES FOUND:"
echo
cat filelist
source line
echo
while read file; do
  ls $file
  mv $file /volume2/push/MAIN/2weeks
  echo
done < filelist
rm -f filelist

##################################################################################


rm -f filelist
echo /volume2/push/MAIN/2weeks 1week
echo
fdfind --changed-within 1week '.*.mp4$' /volume2/push/MAIN/2weeks/ -x echo {.}'*' >> filelist
echo
echo "FILES FOUND:"
echo
cat filelist
source line
echo
while read file; do
  ls $file
  mv $file /volume2/push/MAIN/1week
  echo
done < filelist
rm -f filelist

