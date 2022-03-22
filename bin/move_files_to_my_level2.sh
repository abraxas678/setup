mkdir a_moved
mkdir a_moved_pictures
find . -name *.mp4 -type f -print0 > mymovefiles
while read file; do
  sudo mv $file ./a_moved
done < mymovefiles
rclone rmdirs .
echo jpg
find . -name *.jpg -type f -print0 | xargs -0 mv -t ./a_moved_pictures
echo jpeg
find . -name *.jpeg -type f -print0 | xargs -0 mv -t ./a_moved_pictures
echo png
find . -name *.png -type f -print0 | xargs -0 mv -t ./a_moved_pictures
#source delete_empty_folders.sh
