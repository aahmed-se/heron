#!/usr/bin/env bash

set -e
set -o pipefail

echo "Delete all artifacts"
rm -rf ~/.heron && rm -rf ~/.herondata && rm -rf ~/.herontools && rm -rf ~/.heronapi && rm -rf ~/.herontests

echo "Configure bazel"
python bazel_configure.py

echo "killall Python"
killall Python || echo "No Python processed to kill"

echo "Build Packages"
bazel build -c opt --config=darwin scripts/packages:binpkgs
bazel build -c opt --config=darwin scripts/packages:testpkgs
bazel build -c opt --config=darwin scripts/packages:pypkgs

echo "Install Packages"
./bazel-bin/scripts/packages/heron-client-install.sh --user && ./bazel-bin/scripts/packages/heron-tools-install.sh --user && ./bazel-bin/scripts/packages/heron-tests-install.sh --user

echo "Build Integration Tests"
bazel build --config=darwin integration_test/src/...

# if [ "$1" == "run" ]
# then
#     echo "Starting tests"
#     ./bazel-bin/integration_test/src/python/test_runner/test-runner.pex -hc heron -tb ./bazel-bin/integration_test/src/python/integration_test/topology/heron_integ_topology.pex -rh localhost -rp 8080 -tp integration_test/src/python/integration_test/topology/ -cl local -rl heron-staging -ev devel
# fi

echo "Finish"
