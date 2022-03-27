mytext=$1%20$2%20$3%20$4%20$5%20$6%20$7%20$8%20$9
curl -X POST -H "Content-Type: application/json" -d '{"myvar1":"foo","myvar2":"bar","myvar3":"foobar"}' "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=304c57b5ddbd4c10b03b76fa97d44559&deviceNames=Chrome,ChromeGoogle&title=$1&text=$mytext&title=$mytext"
echo
echo mytext $mytext
echo
mytext2="alert3=:=$mytext"
curl -X POST -H "Content-Type: application/json" -d '{"myvar1":"foo","myvar2":"bar","myvar3":"foobar"}' "https://autoremotejoaomgcd.appspot.com/sendmessage?key=goo.gl:gcmAPA91bEbUPWyCvzMcQwm0n66RtS8SDJSqqTSRdJY8nwGuUVkMKUQrFq8rgSzKxhKrcFmkXUe8gVsUw4y36IQsP8CDz6B7eG7GWMsHXialA7dEH6cmnApnfycEMfbOdcQmqOGybZ8_mtg52dkpmAhlHHPnSojqzE5Vg&message=$mytext2"
