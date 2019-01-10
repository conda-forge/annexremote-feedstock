#!/bin/bash

set -eu -o pipefail -x

nosetests --verbose
python -c "from annexremote import Master, SpecialRemote, RemoteError"
git-annex-remote-directory < /dev/null | grep VERSION

CURDIR=$(pwd)
REMOTE_DIR=$CURDIR/remote
REPO_DIR=$CURDIR/repo
mkdir -p $REMOTE_DIR
mkdir -p $REPO_DIR
pushd $REPO_DIR
git init
git config user.email "someuser@gmail.com"
git config user.name "Some User"
touch README
git add README
git commit -m 'an initial commit' .
git annex init
git annex initremote directory_remote type=external externaltype=directory encryption=none directory=$REMOTE_DIR
git annex testremote --verbose --debug directory_remote
popd
