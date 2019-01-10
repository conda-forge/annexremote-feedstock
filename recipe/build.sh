#!/bin/bash

set -eu -o pipefail

$PYTHON -m pip install . --no-deps --ignore-installed -vv
mkdir -p $PREFIX/bin
cp examples/git-annex-remote-directory $PREFIX/bin/
chmod u+x $PREFIX/bin/git-annex-remote-directory