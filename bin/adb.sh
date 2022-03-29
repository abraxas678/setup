adb connect 192.168.86.$1:5555

if [ ! $2 ];then
  adb -s 192.168.86.$1:5555 shell dumpsys audio | grep Current | head -n 1 | sed 's/(.*//'
  adb -s 192.168.86.$1:5555 shell dumpsys audio | grep Mute | head -n 1
else
#if     adb -s 192.168.86.$1:5555 shell input keyevent 164 
echo
fi
