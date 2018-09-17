#!/bin/sh
set -e

docker build -t riff-aguid .
docker run --rm --name test-riff-aguid -d -p 8080:8080 -p 10382:10382 riff-aguid
sleep 1
docker logs test-riff-aguid

VALUE="Hello"; EXPECT="185f8db3-271f-45f5-8a6f-938b2e264306"
RESULT=$(curl -v -X POST -H "Content-Type: text/plain" --data "$VALUE" http://localhost:8080/)

docker kill test-riff-aguid

echo "aguid $VALUE = $RESULT"
[ "$RESULT" == "$EXPECT" ]
