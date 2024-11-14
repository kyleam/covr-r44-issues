#!/bin/bash

set -eu

name=${1?"usage: $0 NAME"}

cd /pkg
/usr/bin/time \
    --format='%e' \
    /opt/R/"$R_VERSION"/bin/Rscript -e 'covr::package_coverage()' \
      >/output/"$name".stdout 2>/output/"$name".stderr
