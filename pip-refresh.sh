#!/usr/bin/env bash

set -e
set -o pipefail

source ./version_tag.sh

echo "Refresh pip install"

bazel build -c opt --config=darwin scripts/packages:pypkgs

echo "Delete all pip artifacts"

if [[ $(pip show heronpy) ]]; then
	pip uninstall -y heronpy
fi

rm -rf /tmp/heron-pip

echo "Get Version Tag"

VERSION_TAG=$(getVersionTag)

echo "Found Version Tag $VERSION_TAG"

echo "Install new pip artifacts"

pip install ./bazel-genfiles/scripts/packages/heronpy-$VERSION_TAG-py2-none-any.whl

mkdir -p /tmp/heron-pip/heronpy

cp ./bazel-genfiles/scripts/packages/heronpy-$VERSION_TAG-py2-none-any.whl /tmp/heron-pip/

unzip ./bazel-genfiles/scripts/packages/heronpy-$VERSION_TAG-py2-none-any.whl -d /tmp/heron-pip/heronpy

echo "Finish"
