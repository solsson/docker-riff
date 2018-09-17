#!/bin/sh
set -e

docker build -t riff-square .
docker run --rm --name test-riff-square -d -p 8080:8080 -p 10382:10382 riff-square
sleep 1
docker logs test-riff-square

VALUE="4"; EXPECT="16"
RESULT=$(curl -v -X POST -H "Content-Type: text/plain" --data "$VALUE" http://localhost:8080/)

docker kill test-riff-square

echo "Square $VALUE = $RESULT"
[ "$RESULT" -eq "$EXPECT" ]
