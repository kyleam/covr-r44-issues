#!/bin/sh

set -eu

test $# = 3 || {
    printf >&2 'usage: %s <tag> <R version> <patch>\n' "$0"
    exit 2
}

tag=$1
rvers=$2
patch=$3

docker build \
       -f Dockerfile.rutils \
       -t covr-rutils:"$tag" \
       --build-arg R_VERSION="$rvers" \
       --build-arg GID="$(id -g)" \
       --build-arg UID="$(id -u)" \
       --build-arg COVR_PATCH="$patch" \
       .
