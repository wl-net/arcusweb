#!/bin/bash

# Include common functionality
SCRIPT_PATH="$0"
SCRIPT_DIR=$(dirname ${SCRIPT_PATH})
. "${SCRIPT_DIR}/common.sh"

# Push all of the images if none are specified
IMAGES="$@"
if [ -z "${IMAGES}" ]; then
    IMAGES=""
    IMAGES="${IMAGES} eyeris-ui-server"
fi
VERSION=${VERSION:-latest}

docker_push_to_registry() {
    local DOCKER_PATH="$1"
    local DOCKER_NAME="${2:-$(basename ${DOCKER_PATH})}"
    local seperator=${REGISTRY_SEPERATOR:-/}
    local DOCKER_TAG=$(echo "${DOCKER_NAME}" | sed "0,/-/s#-#${seperator}#")
    docker_push "${REGISTRY_NAME}/${DOCKER_TAG}:${VERSION}"
}

# Build the requested images
for image in ${IMAGES}; do
    docker_push_to_registry "${image}"
done

