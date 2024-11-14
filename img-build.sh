#!/bin/sh

set -eu

test $# = 5 || {
    printf >&2 'usage: %s <tag> <R version> <patch> <url> <commit>\n' "$0"
    exit 2
}

tag=$1
rvers=$2
patch=$3
url=$4
commit=$5

docker build \
       -f Dockerfile \
       -t covr:"$tag" \
       --build-arg R_VERSION="$rvers" \
       --build-arg GID="$(id -g)" \
       --build-arg UID="$(id -u)" \
       --build-arg COVR_PATCH="$patch" \
       --build-arg PKG_URL="$url" \
       --build-arg PKG_COMMIT="$commit" \
       .
