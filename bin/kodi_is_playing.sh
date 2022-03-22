#!/bin/bash
#source setv1.sh
if [[ $1 = *"long"* ]]; then
  mytitle=$(kodi_json.sh '{"jsonrpc":"2.0","id":7,"method":"Player.GetItem","params":{"playerid":1,"properties":["mediapath"]}}' | jq '.result.item.mediapath' | sed 's/\"//' | sed 's/\"//' | sed 's/nfs:\/\/192.168.86.29//')
else
  mytitle=$(kodi_json.sh '{"jsonrpc":"2.0","id":6,"method":"Player.GetItem","params":{"playerid":1,"properties":["title"]}}' | jq '.result.item.label' | sed 's/\"//' | sed 's/\"//')
fi
echo $mytitle
