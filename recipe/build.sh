#!/bin/bash

set -eu -o pipefail -x

mkdir -p $PREFIX/bin
$PYTHON -m pip install . --no-deps --ignore-installed -vv

