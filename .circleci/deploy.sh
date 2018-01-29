#!/bin/sh
set -eu

docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"

docker tag "$DOCKER_IMAGE_NAME" "$DOCKER_IMAGE_NAME-$CIRCLE_BUILD_NUM"
docker push "$DOCKER_IMAGE_NAME-$CIRCLE_BUILD_NUM"
