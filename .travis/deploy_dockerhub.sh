#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH" | tr "[:upper:]" "[:lower:]"
fi

docker build -f Dockerfile -t "mogaiskii/devopslearning":$TAG .
docker push "mogaiskii/devopslearning"