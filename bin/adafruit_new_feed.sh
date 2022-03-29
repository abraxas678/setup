curl -X POST -H "Content-Type: application/json" -H "X-AIO-Key: $(echo YWlvX2JoWXg3NjFkTnpBWHE3Z1c2QnJmUlpwMnVpRHcK | base64 --decode)" \
    --data '{"feed": {"name": "dryer"}}' \
    https://io.adafruit.com/api/v2/abraxas678/feeds
