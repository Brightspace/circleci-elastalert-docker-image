#!/bin/sh
set -eu

docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"

if [ "$CIRCLE_BRANCH" == "master" ]; then
    buildTag="build"
else
    buildTag="rc"
fi

publishImageName="${DOCKER_IMAGE_NAME}-${buildTag}${CIRCLE_BUILD_NUM}"
docker tag "$DOCKER_IMAGE_NAME" $publishImageName
docker push "$publishImageName"
