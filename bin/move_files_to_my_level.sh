mkdir a_moved
#mkdir a_moved_pictures
find . -name "*.mp4" -type f -print0 | xargs -0 mv -t ./a_moved
rclone rmdirs . 
echo jpg
find . -name "*.jpg" -type f -print0 | xargs -0 mv -t ./a_moved
echo jpeg
find . -name "*.jpeg" -type f -print0 | xargs -0 mv -t ./a_moved
echo png
find . -name "*.png" -type f -print0 | xargs -0 mv -t ./a_moved
echo nfo
find . -name "*.nfo" -type f -print0 | xargs -0 mv -t ./a_moved
#source delete_empty_folders.sh
