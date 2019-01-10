#!/bin/bash

set -eu -o pipefail -x

nosetests -v
python -c "from annexremote import Master, SpecialRemote, RemoteError"

CURDIR=$(pwd)
REMOTE_DIR=$CURDIR/remote
REPO_DIR=$CURDIR/repo
mkdir -p $REMOTE_DIR
pushd $REPO_DIR
git init
git annex initremote directory_remote type=external externaltype=directory encryption=none directory=$REMOTE_DIR
git annex testremote directory_remote
popd
