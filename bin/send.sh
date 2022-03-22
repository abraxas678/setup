mytext=$2%20$3%20$4%20$5%20$6%20$7%20$8%20$9
curl -X POST -H "Content-Type: application/json" -d '{"myvar1":"foo","myvar2":"bar","myvar3":"foobar"}' "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=304c57b5ddbd4c10b03b76fa97d44559&deviceNames=Chrome,ChromeGoogle&title=$1&text=$mytext&title=$mytext"
