./adafruit.sh | tac | tac | jq | grep 1834576 --after-context=10 | grep '"last_value":' | sed 's/.*\://' | sed 's/"//' | sed 's/",//'
