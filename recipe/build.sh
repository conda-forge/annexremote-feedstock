#!/bin/bash

set -eu -o pipefail -x

pwd
ls -altR

$PYTHON -m pip install . --no-deps --ignore-installed -vv
mkdir -p $PREFIX/bin
