#!/bin/bash
curl --silent -X POST -H 'Content-Type: application/json' http://kodi:11223344@192.168.86.30:8080/jsonrpc --data "$1"
