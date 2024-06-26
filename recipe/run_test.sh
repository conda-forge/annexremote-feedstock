#!/bin/bash

set -eu -o pipefail -x

python -m pytest -s -v tests
python -c "from annexremote import Master, SpecialRemote, RemoteError"

# With coming release, just do
# ./examples/test_git-annex-remote-directory
# and remove all below
chmod u+x examples/git-annex-remote-directory

CURDIR=$(pwd)
export PATH=$CURDIR/examples:$PATH

git-annex-remote-directory < /dev/null | grep VERSION

REMOTE_DIR=$CURDIR/remote
REPO_DIR=$CURDIR/repo
mkdir -p $REMOTE_DIR
mkdir -p $REPO_DIR
pushd $REPO_DIR
git init
git config user.email "someuser@gmail.com"
git config user.name "Some User"
git annex init
git annex initremote --verbose --debug directory_remote type=external externaltype=directory encryption=none directory=$REMOTE_DIR
git annex testremote --verbose --debug directory_remote  2>&1 | tail -n 1000
popd
