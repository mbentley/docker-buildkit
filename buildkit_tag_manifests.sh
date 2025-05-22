#!/bin/bash

set -e

# set expected major.minor tags
EXPECTED_MAJOR_MINOR_TAGS="0.22 0.21 0.20"

tag_manifest() {
  # set this again for use in parallel
  set -e

  # get expected tag from first argument
  EXPECTED_TAG="${1}"

  # get latest full version from GitHub releases
  echo -n "Getting full version for v${EXPECTED_TAG} from GitHub releases..."
  BUILDKIT_VERSION="$(echo "${BUILDKIT_RELEASES}" | grep "^v${EXPECTED_TAG}\." | head -n 1)"

  # check to see if we received a buildkit version from github tags
  if [ -z "${BUILDKIT_VERSION}" ]
  then
    echo -e "error\nERROR: unable to retrieve the buildkit version from GitHub\n"
    exit 1
  fi

  echo "${BUILDKIT_VERSION}"

  # check to see if this is a non-GA version
  if [ -n "$(echo "${BUILDKIT_VERSION}" | awk -F '-' '{print $2}')" ]
  then
    echo -e "ERROR: non-GA version ${BUILDKIT_VERSION} found!\n"
    exit 1
  fi

  # get digest for image
  echo -n "Getting digests for moby/buildkit:${BUILDKIT_VERSION} from Docker Hub..."
  TAG_DIGESTS="$(docker buildx imagetools inspect --raw "moby/buildkit:${BUILDKIT_VERSION}" | jq -r '.manifests | .[] | select(.platform.os == "linux") | .digest')"

  # check to see if we got a tag digest
  if [ -z "${TAG_DIGESTS}" ]
  then
    echo -e "error\nERROR: TAG_DIGESTS not set!\n"
    exit 1
  fi

  echo "done"

  # get the destination tag we want to use
  DESTINATION_TAG="$(echo "${BUILDKIT_VERSION}" | awk -F 'v' '{print $2}' | awk -F '.' '{print $1"."$2}')"

  # check to see if we got a tag digest
  if [ -z "${DESTINATION_TAG}" ]
  then
    echo -e "ERROR: DESTINATION_TAG not set!\n"
    exit 1
  fi

  # check to see if the major.minor tag is no longer the value of EXPECTED_TAG
  if [ "${DESTINATION_TAG}" != "${EXPECTED_TAG}" ]
  then
    echo -e "ERROR: the major.minor tag is no longer ${EXPECTED_TAG}; we found ${BUILDKIT_VERSION}!\n"
    exit 1
  fi

  # create the new manifest and push the manifest to docker hub
  echo -n "Create new manifest and push to Docker Hub..."
  # shellcheck disable=SC2046
  docker buildx imagetools create --progress plain -t "mbentleyvmware/buildkit-test:v${DESTINATION_TAG}" $(for TAG_DIGEST in ${TAG_DIGESTS}; do echo -n "moby/buildkit@${TAG_DIGEST} "; done)

  echo -e "done\n"
}

# get last 100 release tags from GitHub; filter out rc and beta releases
BUILDKIT_RELEASES="$(wget -q -O - "https://api.github.com/repos/moby/buildkit/tags?per_page=100&page=1" | jq -r '.[] | select((.name | contains("-rc") | not) and (.name | contains("-beta") | not)) | .name' | sort --version-sort -r)"

# load env_parallel
. "$(command -v env_parallel.bash)"

# run multiple tags in parallel
# shellcheck disable=SC2086
#env_parallel --env tag_manifest --env BUILDKIT_RELEASES --env EXPECTED_MAJOR_MINOR_TAGS --halt soon,fail=1 -j 4 tag_manifest ::: ${EXPECTED_MAJOR_MINOR_TAGS}


# loop through to get all tags
for MAJ_MIN_TAG in ${EXPECTED_MAJOR_MINOR_TAGS}
do
  echo "v${MAJ_MIN_TAG}"
  TAG_LIST="$(echo "${BUILDKIT_RELEASES}" | grep "^v${MAJ_MIN_TAG}\." | awk -F 'v' '{print $2}' | xargs)"
  echo "${MAJ_MIN_TAG} ${TAG_LIST}"
  echo
done
