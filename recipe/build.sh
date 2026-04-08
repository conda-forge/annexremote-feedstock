#!/bin/bash

set -eu -o pipefail -x

$PYTHON -m pip install . --no-deps --no-build-isolation -vv

