#!/bin/sh
set -eu

docker login --username "$DOCKER_LOGIN" --password "$DOCKER_PASSWORD"
docker push "$DOCKER_IMAGE_NAME"
