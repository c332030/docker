#!/bin/sh

echo 'pull-and-push'

set -e

USERNAME=$1
PASSWORD=$2

ORIGIN_IMAGE=$3

REGISTRY=$4
IMAGE_NAME=$5

docker login -u ${USERNAME} -p ${PASSWORD} ${REGISTRY}
docker image tag ${ORIGIN_IMAGE} ${REGISTRY}/${IMAGE_NAME}
docker push ${REGISTRY}/${IMAGE_NAME}
docker logout ${REGISTRY}
