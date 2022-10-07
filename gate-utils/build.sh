#!/bin/bash
SCRIPT=`realpath $0`
SCRIPT_DIR=`dirname ${SCRIPT}`
## Only build from main folder
cd ${SCRIPT_DIR}/..

IMAGE="gate-utils"
VERSION=${VERSION:-latest}
DISTRO=${DISTRO:-debian}
REGISTRY_URI=${REGISTRY_URI:-"openstackhelm/"}
EXTRA_TAG_INFO=${EXTRA_TAG_INFO:-""}
docker build -f ${IMAGE}/Dockerfile.${DISTRO} --network=host -t ${REGISTRY_URI}${IMAGE}:${VERSION}-${DISTRO}${EXTRA_TAG_INFO} ${extra_build_args} ${IMAGE}

cd -
