#!/bin/sh

set -eu

tag=${1?"usage: $0 TAG"}

mkdir -p output
docker run -it -v "$(pwd)"/output:/output --rm \
       covr-rutils:"$tag" /run.sh rutils-"$tag"
