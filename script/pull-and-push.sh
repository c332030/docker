#!/bin/sh

echo 'pull-and-push'

set -e

echo "
ORIGIN_IMAGE: ${ORIGIN_IMAGE}
REGISTRY: ${REGISTRY}
IMAGE_NAME: ${IMAGE_NAME}
"

docker pull ${ORIGIN_IMAGE}

docker login -u ${USERNAME} -p ${PASSWORD} ${REGISTRY}
docker image tag ${ORIGIN_IMAGE} ${REGISTRY}/${IMAGE_NAME}
docker push ${REGISTRY}/${IMAGE_NAME}

docker logout ${REGISTRY}

docker system prune -af
