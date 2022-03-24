i=21
while [ $i -lt "100" ]; do
  echo "https://thisvid.com/male/$i/?q=facial" >> mydownloader
  i=$((i+1))
done
cat mydownloader | xclip
