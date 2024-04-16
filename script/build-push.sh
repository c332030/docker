#!/bin/sh

# curl -sL https://github.com/cc332030/docker/raw/master/script/build-push.sh | sh

set -e

if test -f ".env"; then
  . ./.env
fi

if [ ! "${PROJECT}" ]; then
  echo "no PROJECT"
  exit 0
fi

if [ ! "${AUTHOR}" ]; then
  echo "no AUTHOR"
  exit 0
fi

if [ ! "${DOCKER_TOKEN}" ]; then
  echo "no DOCKER_TOKEN"
  exit 0
fi

REGISTRY="${REGISTRY:=docker.io}"

IMAGE=${REGISTRY}/${AUTHOR}/${PROJECT}
IMAGE_TAG="${IMAGE_TAG:=latest}"
IMAGE_WITH_TAG=${IMAGE}:${IMAGE_TAG}

echo "
IMAGE: ${IMAGE_WITH_TAG}
BUILD_ARGS: ${BUILD_ARGS}
"

IMAGE_BUILD_CACHE=${IMAGE}:buildcache

docker login -u="${AUTHOR}" -p="${DOCKER_TOKEN}"

BUILDX_NAME=buildx-c332030

docker buildx rm "${BUILDX_NAME}" || true
docker buildx create --name "${BUILDX_NAME}" --driver docker-container --use
docker buildx build \
  ${BUILD_ARGS} \
  --cache-from type=registry,ref="${IMAGE_BUILD_CACHE}" \
  --cache-to type=registry,ref="${IMAGE_BUILD_CACHE}",mode=max \
  --tag "${IMAGE_WITH_TAG}" \
  --push .

docker buildx rm "${BUILDX_NAME}" || true
docker logout
