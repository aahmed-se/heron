#!/bin/bash

VERSION_TAG="0.0.0"

function getVersionTag {
	echo $VERSION_TAG
}


# echo "Get Version Tag"

# VERSION_STRING=$(cat bazel-out/volatile-status.txt | grep HERON_BUILD_VERSION)
# VERSION_TAG=$(echo $VERSION_STRING | cut -d " " -f 2)
# VERSION_TAG=$([[ -z $VERSION_TAG ]] && echo "0.0.0" || echo $VERSION_TAG)

# echo "Found Version Tag $VERSION_TAG"