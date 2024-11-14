#!/bin/sh

set -eu

tag=${1?"usage: $0"}

mkdir -p output
docker run -it -v "$(pwd)"/output:/output --rm \
       covr:"$tag" /run.sh "$tag"
