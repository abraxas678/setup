export IO_USERNAME="abraxas678"
export IO_KEY="$(echo YWlvX2JoWXg3NjFkTnpBWHE3Z1c2QnJmUlpwMnVpRHcK | base64 --decode)"
curl --silent -H "X-AIO-Key: $(echo YWlvX2JoWXg3NjFkTnpBWHE3Z1c2QnJmUlpwMnVpRHcK | base64 --decode)" \
  https://io.adafruit.com/api/v2/abraxas678/feeds
