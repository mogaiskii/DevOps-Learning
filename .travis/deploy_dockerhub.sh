#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
	TRAVIS_REPO_SLUG_LOW = $TRAVIS_REPO_SLUG | tr "[:upper:]" "[:lower:]"
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH" | tr "[:upper:]" "[:lower:]"
    TRAVIS_REPO_SLUG_LOW = $TRAVIS_REPO_SLUG | tr "[:upper:]" "[:lower:]"
fi

docker build -f Dockerfile -t $TRAVIS_REPO_SLUG_LOW:$TAG .
docker push $TRAVIS_REPO_SLUG_LOW